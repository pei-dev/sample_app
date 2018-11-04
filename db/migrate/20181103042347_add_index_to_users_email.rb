class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    #add_indexはRailsのメソッドで、第一引数はusersのシンボル、 第二引数はemailのシンボル、第３引数はuniqueのhash値がtrue
    add_index :users, :email, unique: true
  end
end
