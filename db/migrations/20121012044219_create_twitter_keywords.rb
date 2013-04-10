Sequel.migration do
  up do
    create_table :twitter_keywords do
      primary_key :id
      string :keyword
    end
  end
  
  down do
    delete_table :twitter_keywords
  end
end
