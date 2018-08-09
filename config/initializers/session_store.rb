Rails.application.config.session_store :active_record_store, key: Rails.application.credentials.secret_key_base
SessionTrimJob.perform_later # start session trim job
