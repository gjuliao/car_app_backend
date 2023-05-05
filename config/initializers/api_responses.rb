CAR_RESPONSES = {
  :created => { errors: false, message: 'Car successfully created', status: :created },
  :unable_to_create => { errors: true, message: 'Unable to create car', status: :unprocessable_entity },
  :updated => { errors: false, message: 'Car successfully updated', status: :ok },
  :unable_to_update => { errors: true, message: 'Unable to update car', status: :unprocessable_entity },
  :deleted => { errors: false, message: 'Car successfully deleted', status: :ok },
  :unable_to_delete => { errors: true, message: 'Unable to delete car', status: :unprocessable_entity },
  :founded => { errors: false, message: 'Car founded', status: :ok },
  :not_found => { errors: true, message: 'Car not found', status: :not_found },
  :none_attribute => { errors: true, message: 'None attribute to update', status: :bad_request }
}