defmodule Surface.Catalogue.Router do
  defmacro surface_catalogue(path, opts \\ []) do
    quote bind_quoted: binding() do
      pipeline :catalogue_layout do
        plug :put_root_layout, {Surface.Catalogue.LayoutView, :root}
      end

      pipeline :no_layout do
        plug :put_root_layout, false
      end

      scope path, alias: false, as: false do
        pipe_through [:catalogue_layout]

        import Phoenix.LiveView.Router, only: [live: 2]

        alias Surface.Catalogue.{
          PageLive,
          ExampleLive,
          PlaygroundLive
        }

        live "/", PageLive
        live "/components/:component/", PageLive
        live "/components/:component/:action", PageLive

        scope "/", root_layout: false do
          pipe_through [:no_layout]

          live "/examples/:example", ExampleLive
          live "/playgrounds/:playground", PlaygroundLive
        end
      end
    end
  end
end
