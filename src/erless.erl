-module(erless).

-export([
  start/0,
  stop/0,
  compile/1
  ]).

start() ->
  ev8_node:start(),
  application:start(erless).

stop() ->
  application:stop(erless).

compile(File) ->
  erless_srv:compile(File).
