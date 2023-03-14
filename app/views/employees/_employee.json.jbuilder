json.extract! employee, :id, :first_name, :last_name, :email, :phone_number, :job_title, :department_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)
