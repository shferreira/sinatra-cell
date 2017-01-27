module Sinatra
  # Sinatra-cell is a very simple extension that allows you to define reusable 'content cells' by using idiomatic Sinatra. They are defined with the cell method and renderable via the render_cell method.
  module Cell
    # The method 'cell' declares a cell. You should pass a block, just like with other Sinatra declarations. The block retains local scope and receives one parameter, which is a hash containing some extra options.
    #
    #   cell :cart do |opts|
    #     @cart = @current_user.get_cart(opts[:section])
    #     haml :'cells/cart'
    #   end
    def cell(name, &block)
      cells[name] = block
    end

    module Helpers
      # The "render_cell" helper renders the content. It can be used in views and controllers and might optionally receive a hash of parameters.
      #
      #   render_cell :cart, :section => 'clothes'
      def render_cell(name, opts = {})
        instance_exec(opts, &cells[name]) if cells[name]
      end
    end

    def cells
      @cells ||= {}
    end

    def self.registered(app)
      app.helpers Helpers
    end
  end

  register Cell
end
