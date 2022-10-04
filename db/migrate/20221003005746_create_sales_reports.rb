class CreateSalesReports < ActiveRecord::Migration[6.1]
  def change
    create_table :sales_reports do |t|
      t.string :file_name
      t.boolean :processed
      t.string :last_error
      t.float :gross_sum
      t.binary :file

      t.timestamps
    end
  end
end
