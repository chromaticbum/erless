
-module(erless_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
  ErlessSrvSpec = {erless_srv,
                   {erless_srv, start_link, []},
                   permanent, 5000, worker, [erless_srv]},
  {ok, { {one_for_one, 5, 10}, [ErlessSrvSpec]} }.

