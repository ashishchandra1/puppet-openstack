class openstack-keystone::initiate-fernet inherits openstack-keystone::params {    

    notify {"Setting up Fernet Token Provider":} ->
    exec {"Fernet Setup":
        command => 'keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone',
        user => 'root',
    } ->
   
    notify {"Setting up Credentials":} ->
    exec {"Credential Setup":
        command => 'keystone-manage credential_setup --keystone-user keystone --keystone-group keystone',
        user => 'root',
    }
}
