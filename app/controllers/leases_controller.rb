class LeasesController < ApplicationController
#start with my rescue function
rescue ActiveRecord::RecordNotFound, with: :render_not_found_response
    #Create and delete Lease
    #CREATE /lease
    def create
        lease = Lease.create!(lease_params)
        render json: lease, status: :created
    end
    #DELETE:/lease/:id
    def destroy!
        lease = find_lease
        lease.destroy
        head :no_content
    end

    private

    def lease_params
        params.permit(:rent)
    end

    def find_lease
        lease = Lease.find(params[:id])
    end

    def render_not_found_response
        render json: { error: "Lease not found" }, status: :not_found
    end
end
