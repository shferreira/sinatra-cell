require 'rspec'
require 'rack/test'
require 'sinatra'
require 'sinatra/cell'

cell :login do |opt|
  "result: #{@value} - #{opt[:x] rescue ''}"
end

get '/:v1/:v2' do |v1, v2|
  @value = v1

  render_cell :login, :x => v2
end

describe "sinatra-cell" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'renders the cell as expected, keeping the scope' do
    get '/one/two'
    last_response.body.should == "result: one - two"
  end
end
