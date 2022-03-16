class TenantsController < ApplicationController
    #Create, read, update and delete Tenants
    #READ /tenants
    def index
        tenants = Tenant.all
        render json: tenants
    end
    #CREATE /tenants

    #Update /tenants/:id

    #Destroy /tenants/:id


    private

    def tenant_params
        params.permit(:name, :age)
    end

    def find_tenant
        tenant = Tenant.find_by(id: params[:id])
    end

    

end
