Sequel.migration do
  change do
    create_table :facts do
      primary_key :id
      string :fact
    end
  end
end
