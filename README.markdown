Sinatra::Cell
=============

Sinatra::Cell is a very simple extension that allows you to define reusable 'content cells' by using idiomatic Sinatra. They are defined with the cell method and renderable via the render_cell method.

It is useful for anything that repeats a lot among your pages, such as login boxes, menus, shopping carts, advertisement and other widgets.

In practice, it's just syntatic sugar for helper methods, using a hash for 'named' parameters, but it's asthetically closer to other Sinatra declarations.

## Installing

To install this gem, just use the gem command:

    gem install sinatra-cell

## Declaring a cell

The method 'cell' declares a cell. You should pass a block, just like with other Sinatra declarations. The block retains Sinatra's scope and receives one parameter, which is a hash containing some extra options.

    cell :cart do |opts|
      @cart = @current_user.get_cart(opts[:section])
      haml :'cells/cart'
    end

## Rendering a cell

The "render_cell" helper renders the content. It can be used in views and controllers and might optionally receive a hash of parameters. This is an example, using ERB:

    <%= render_cell :cart, :section => 'clothes' %>

## Modular Style

To use this gem on Modular Style apps, you just need to register it:

    class MyApp < Sinatra::Base
      register Sinatra::Cell

      ...
    end

## Requirements

Sinatra::Cell uses the instance_exec method, and requires Ruby 1.8.7 (OS X default) or 1.9.
