fn handler_func(ctx: &mut context) {}

type handler_func = fn(&mut context);
type handlers_chain = [handler_func];

struct engine {
    router: router,
    middleware: handlers_chain,
}

impl engine {
    fn new() -> engine {
        engine {
            router: router::new(),
            middleware: [],
        }
    }

    fn use(&mut self, handler: handler_func) {
        self.middleware.push(handler);
    }

    fn add_route(&mut self, method: str, path: str, handler: handler_func) {
        self.router.add_route(method, path, handler);
    }

    fn handle_request(&self, mut ctx: context) {
        for mw in &self.middleware {
            mw(&mut ctx);
        }
        self.router.route(&mut ctx);
    }
}

struct context {
    request: request,
    response: response,
}

struct router {
}

impl router {
    fn new() -> router {
        router {
        }
    }

    fn add_route(&mut self, method: str, path: str, handler: handler_func) {
    }

    fn route(&self, ctx: &mut context) {
    }
}

struct request {}
impl request {
    fn new() -> request {
        request {}
    }
}

struct response {}
impl response {
    fn new() -> response {
        response {}
    }
}
