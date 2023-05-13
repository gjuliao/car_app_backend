CARS_RESPONSES = {
  :created => { errors: false, message: 'Car successfully created', status: :created },
  :unable_to_create => { errors: true, message: 'Unable to create car', status: :unprocessable_entity },
  :updated => { errors: false, message: 'Car successfully updated', status: :ok },
  :unable_to_update => { errors: true, message: 'Unable to update car', status: :unprocessable_entity },
  :deleted => { errors: false, message: 'Car successfully deleted', status: :ok },
  :unable_to_delete => { errors: true, message: 'Unable to delete car', status: :unprocessable_entity },
  :found => { errors: false, message: 'Car found', status: :ok },
  :not_found => { errors: true, message: 'Car not found', status: :not_found },
  :none_attribute => { errors: true, message: 'None attribute to update', status: :bad_request },
  :unauthorized => { errors: true, message: 'You are not authorized to perform this action', status: :unauthorized },
  :unauthenticated => { errors: true, message: 'You need to sign in or sign up before continuing.', status: :unauthorized }
}

RESERVATIONS_RESPONSES = {
  :created => { errors: false, message: 'Reservation successfully created', status: :created },
  :unable_to_create => { errors: true, message: 'Unable to create reservation', status: :unprocessable_entity },
  :updated => { errors: false, message: 'Reservation successfully updated', status: :ok },
  :unable_to_update => { errors: true, message: 'Unable to update reservation', status: :unprocessable_entity },
  :cancelled => { errors: false, message: 'Reservation successfully cancelled', status: :ok },
  :unable_to_cancel => { errors: true, message: 'Unable to cancel reservation', status: :unprocessable_entity },
  :found => { errors: false, message: 'Reservation found', status: :ok },
  :not_found => { errors: true, message: 'Reservation not found', status: :not_found },
  :none_attribute => { errors: true, message: 'None attribute to update', status: :bad_request },
  :unauthorized => { errors: true, message: 'You are not authorized to perform this action', status: :unauthorized },
  :unauthenticated => { errors: true, message: 'You need to sign in or sign up before continuing.', status: :unauthorized }
  }

USERS_RESPONSES = {
  :created => { errors: false, message: 'User successfully created', status: :created },
  :unable_to_create => { errors: true, message: 'Unable to create user', status: :unprocessable_entity },
  :updated => { errors: false, message: 'User successfully updated', status: :ok },
  :unable_to_update => { errors: true, message: 'Unable to update user', status: :unprocessable_entity },
  :deleted => { errors: false, message: 'User successfully deleted', status: :ok },
  :unable_to_delete => { errors: true, message: 'Unable to delete user', status: :unprocessable_entity },
  :found => { errors: false, message: 'User found', status: :ok },
  :not_found => { errors: true, message: 'User not found', status: :not_found },
  :none_attribute => { errors: true, message: 'None attribute to update', status: :bad_request },
  :unauthorized => { errors: true, message: 'You are not authorized to perform this action', status: :unauthorized },
  :unauthenticated => { errors: true, message: 'You need to sign in or sign up before continuing.', status: :unauthorized }
}

SESSIONS_RESPONSES = {
  :signed_in => { errors: false, message: 'User successfully signed in', status: :ok },
  :signed_out => { errors: false, message: 'User successfully signed out', status: :ok },
  :unable_to_sign_up => { errors: true, message: 'Unable to sign up', status: :unprocessable_entity },
  :already_signed_out => { errors: false, message: 'User already signed out', status: :ok }
}

REGISTRATIONS_RESPONSES = {
  :unauthenticated => { errors: true, message: 'You need to sign in or sign up before continuing.', status: :unauthorized },
  :signed_up => { errors: false, message: 'User successfully signed up', status: :created },
  :unable_to_sign_up => { errors: true, message: 'Unable to sign up', status: :unprocessable_entity },
  :account_deleted => { errors: false, message: 'User account successfully deleted', status: :ok }
}