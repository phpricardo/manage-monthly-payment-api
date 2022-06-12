module Api
  module V1
    class EnrollmentsController < ApplicationController
      include ActionController::HttpAuthentication::Basic::ControllerMethods
      http_basic_authenticate_with name: "admin_ops", password: "billing", only: :create

      before_action :set_enrollment, only: %i[ show update destroy ]

      # GET /enrollments
      def index
        @enrollments = Enrollment.all.page(params[:page]).per(params[:count])

        render json: { page: params[:page], items: @enrollments.as_json(except: [:created_at, :updated_at], include: { bills: { except: [:created_at, :updated_at, :enrollment_id] }}) }
      end

      # GET /enrollments/1
      def show
        render json: @enrollment
      end

      # POST /enrollments
      def create
        @enrollment = Enrollment.new(enrollment_params)

        if @enrollment.save
          render json: @enrollment.as_json(except: [:created_at, :updated_at], include: { bills: { except: [:created_at, :updated_at, :enrollment_id] }}), status: :created
        else
          render json: @enrollment.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /enrollments/1
      def update
        if @enrollment.update(enrollment_params)
          render json: @enrollment
        else
          render json: @enrollment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /enrollments/1
      def destroy
        @enrollment.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_enrollment
          @enrollment = Enrollment.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def enrollment_params
          params.require(:enrollment).permit(:amount, :installments, :due_day, :student_id)
        end
    end
  end
end
