module Response
  def json_response(object, associations, status = :ok)
    render json: JSON.pretty_generate(JSON.parse(object.to_json(include: associations, status: status)))
  end
end
