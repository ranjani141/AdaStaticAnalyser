#ifndef TILER_GLB_MODEL_H
#define TILER_GLB_MODEL_H

#include "include/options.h"
#include "include/solver.h"
#include "include/llvm_decls.h"

class arr_write_expr {
public:
  arr_write_expr();
  arr_write_expr( expr updated_expr_, expr size_bound_guard_, expr new_name_ ) : 
  updated_expr(updated_expr_), size_bound_guard(size_bound_guard_), new_name(new_name_) {

  }
  expr updated_expr;
  expr size_bound_guard;
  expr new_name; 
};

class arr_read_expr {
public:
  arr_read_expr();
  arr_read_expr( expr return_val_, expr size_bound_guard_ ) : 
  return_val(return_val_), size_bound_guard(size_bound_guard_) {

  }
  expr return_val;
  expr size_bound_guard;
};

class array_state{
public:

  // array_state( unsigned total_partitions ) {
  //   pm_state = new partition_model_state();
  // }
  array_state() {}

  //anything else is needed???
  std::vector<expr>& get_name_vec() { return array_index_names; };
private:
  std::vector<expr> array_index_names;
};


class array_model_full;
class array_model_fixed_len;
class array_model_partition;

class array_model{
public:
  array_model( options& o_ ) :
    o(o_), solver_ctx(o.solver_ctx) {}
std::map< unsigned, array_state > exit_ary_map;
  expr join_array_state( std::vector<expr>&,
                         std::vector<unsigned>& prevs,
                         unsigned src );
  virtual expr get_fresh_ary_name( unsigned ) = 0;

  array_state& get_state( unsigned b );
  void set_array_state( unsigned b, array_state& s );
  expr get_array_state_var( unsigned b, unsigned ith_ary );

private:
  options& o;
  solver_context& solver_ctx;
  array_model_t model = NONE;
  //std::map< unsigned, array_state > exit_ary_map;

  friend array_model_full;
  friend array_model_fixed_len;
  friend array_model_partition;
};

class array_model_full : public array_model {
public:
  array_model_full( options& o ) : array_model(o) {
    model = FULL;
  }
std::vector< std::string > ar_names;
  std::vector< sort > ar_sorts;
  //void set_array_num( unsigned len );
  // void set_array_num(std::vector<const llvm::Type*>& arr_type);
  void set_array_info(std::map< const llvm::Value*, unsigned >& ary_id);

  // inline void set_array_num( std::vector<sort>& sorts ) {
  //   ar_sorts = sorts;
  //   num_arrays = ar_sorts.size();
  // }

  inline void
  set_access_map( std::map< const llvm::Instruction*, unsigned >& map ) {
    ary_access_to_index = map;
  }

  // inline void
  // set_lengths_vec( std::vector< expr >& array_lengths ) {
  //   lengths = array_lengths;
  // }

  // inline  std::vector<expr>&
  // get_lengths_vec() {
  //   return lengths;
  // }

  // void init_state( const bb* );
  void init_state( unsigned );
  void init_state( unsigned eb, array_state& s );
  virtual expr get_fresh_ary_name( unsigned );
  //virtual

  void set_array_length( unsigned, std::vector<expr>& len );
  arr_write_expr
  array_write( unsigned bidx, const llvm::StoreInst* I,
               exprs& idx, expr& val );
  arr_read_expr array_read( unsigned bidx, const llvm::LoadInst* I, exprs& );

  void update_names( unsigned, std::vector<const llvm::Instruction*>&);
  void update_name( unsigned, unsigned );
  void copy_to_init_state( array_state& );

private:
  unsigned num_arrays;
  //std::vector< std::string > ar_names;
  //std::vector< sort > ar_sorts;
  std::vector< std::vector<expr> > lengths; // a list of lengths for each array
  // std::vector< expr > lengths; // length of arrays can be symbolic
                               // todo: support tuples
  std::map< const llvm::Instruction*, unsigned > ary_access_to_index;

  // converting llvm array sorts to solver sorts
  sort get_address_sort();
  sort get_solver_array_ty( const llvm::ArrayType* ty );
  sort get_solver_array_ty( const llvm::PointerType* ty );
  std::vector<expr> get_array_length( const llvm::Value* arr );
  void get_array_length( const llvm::ArrayType*, std::vector<expr>&);

  expr access_bound_cons( exprs& idxs, exprs& ls);

  unsigned get_accessed_array( const llvm::Instruction* I );
  void dump_ary_access_to_index();

};

// class array_model_fixed_len : public array_model {
// public:
//   array_model_fixed_len( options& ctx_ ) : array_model(ctx_) {
//     model = FIXED_LEN;
//   }

//   // void init_state( const bb* );
//   void init_state( unsigned );

//   inline void set_partition_len( unsigned len ) { num_partition = len; }
//   inline void
//   set_access_map( std::map< const llvm::Instruction*, unsigned >& map ) {
//     ary_access_to_patition_map = map;
//   }
//   virtual expr get_fresh_ary_name( unsigned );
  
//   arr_write_expr
//   array_write( unsigned bidx, const llvm::StoreInst* I, expr& idx, expr& val );
//   arr_read_expr array_read( unsigned bidx, const llvm::LoadInst* I, expr& val );

// private:
//   unsigned num_partition=0;
//   std::map< const llvm::Instruction*, unsigned > ary_access_to_patition_map;

// };

// class array_model_partition : public array_model {
// public:
//   array_model_partition( options& ctx_ ) : array_model(ctx_) {
//     model = PARTITION;
//   }
//   virtual expr get_fresh_ary_name( unsigned );

// };

// class glb_state {
// public:
//   glb_state() {}
//   std::vector<expr>& get_glb_name_vec() { return glb_names; };

// private:
//   std::vector<expr> glb_names;
// };

// class glb_model{
// public:
//   glb_model( solver_context& ctx_ ) : solver_ctx(ctx_) {}
//   glb_model( solver_context& ctx_, glb_model& g_m_ ) : solver_ctx(ctx_)
//     , exit_glb_map( g_m_.get_exit_glb_map() )
//     , glb_sorts( g_m_.get_sorts() )
//     , glb_to_id( g_m_.get_glb_to_id() )
//     , name_to_glb( g_m_.get_name_to_glb() )
//   {}

//   void update_name(unsigned, std::vector<const llvm::GlobalVariable*>&);
//   expr join_glb_state( std::vector<expr>&,
//                            std::vector<unsigned>&, unsigned
//                           // std::vector<const bb*>&, const bb*
//                            );
//   void init_state( unsigned );
//   void set_state( unsigned, glb_state& );

//   expr get_fresh_glb_name( unsigned, std::string );
//   expr get_fresh_glb_name( unsigned );

//   void insert_glb_sort( sort );
//   void insert_glb_to_id( const llvm::GlobalVariable*, unsigned );
//   void insert_name_to_glb( std::string, const llvm::GlobalVariable* );

//   std::pair<expr,expr> glb_write( unsigned bidx,
//                                           const llvm::StoreInst* ,
//                                           expr& );
//   expr glb_read( unsigned bidx, const llvm::LoadInst* );

//   glb_state& get_state( unsigned b ) { return exit_glb_map.at(b); }


//   inline void set_glb_to_id( std::map< const llvm::GlobalVariable*, unsigned >& g_id_map) {
//     glb_to_id = g_id_map;
//   }

//   inline void set_name_to_glb( std::map< std::string, const llvm::GlobalVariable* >& name_glb_map) {
//     name_to_glb = name_glb_map;
//   }

//   void refresh_glb_state( unsigned bidx, const llvm::GlobalVariable* g);

//   expr get_state_var( unsigned bidx, const llvm::GlobalVariable* g);

//   expr get_state_var( unsigned bidx, unsigned i);

//   std::map< const llvm::GlobalVariable*, unsigned >& get_glb_to_id() {
//     return glb_to_id;
//   }

//   std::vector< sort >& get_sorts() {
//     return glb_sorts;
//   }

//   std::map< unsigned, glb_state >& get_exit_glb_map() {
//     return exit_glb_map;
//   }

//   std::map< std::string, const llvm::GlobalVariable*>& get_name_to_glb() {
//     return name_to_glb;
//   }

// private:
//   solver_context& solver_ctx;
//   std::map< unsigned, glb_state > exit_glb_map;
//   std::vector< sort > glb_sorts;
//   std::map< const llvm::GlobalVariable*, unsigned > glb_to_id;
//   std::map< std::string, const llvm::GlobalVariable*> name_to_glb;
// };

//update heap model


#endif // TILER_GLB_MODEL_H
