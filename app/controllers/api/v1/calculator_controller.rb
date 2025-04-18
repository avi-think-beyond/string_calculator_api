class Api::V1::CalculatorController < ApplicationController
  def add
    result = StringCalculator.calculate(params[:numbers])
    render json: { result: result }
  rescue => e
    render json: { error: e.message }, status: 400
  end
end