Sequel.migration do
  up do
    create_table :tweeple do
      primary_key :twitter_id, :integer, :auto_increment => false
      string :screen_name
    end
  end
  
  down do
    delete_table :tweeple
  end
end
