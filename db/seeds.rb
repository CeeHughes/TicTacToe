[
  Game,
  Player,
  Move
].each(&:delete_all)

ai = Player.create!(
  name: "AI",
  email: "ai@ai.com",
  password: "password"
)

cee = Player.create!(
  name: "Cee",
  email: "cee@cee.com",
  password: "password"
)

jon = Player.create!(
  name: "Jon",
  email: "jon@jon.com",
  password: "password"
)

game_1 = Game.create!(
  player_x: cee,
  player_o: jon
)

game_2 = Game.create!(
  player_x: cee,
  player_o: ai
)

game_1_move_1 = Move.create!(
  game: game_1,
  player: cee,
  position: 0
)

game_1_move_2 = Move.create!(
  game: game_1,
  player: jon,
  position: 1
)

game_1_move_3 = Move.create!(
  game: game_1,
  player: cee,
  position: 3
)

game_1_move_4 = Move.create!(
  game: game_1,
  player: jon,
  position: 4
)

game_1_move_5 = Move.create!(
  game: game_1,
  player: cee,
  position: 6
)

game_2_move_1 = Move.create!(
  game: game_2,
  player: jon,
  position: 0
)

game_2_move_2 = Move.create!(
  game: game_2,
  player: cee,
  position: 1
)

game_2_move_3 = Move.create!(
  game: game_2,
  player: jon,
  position: 2
)

game_2_move_4 = Move.create!(
  game: game_2,
  player: cee,
  position: 3
)

game_2_move_5 = Move.create!(
  game: game_2,
  player: jon,
  position: 4
)

game_2_move_6 = Move.create!(
  game: game_2,
  player: cee,
  position: 5
)

game_2_move_7 = Move.create!(
  game: game_2,
  player: jon,
  position: 6
)

game_2_move_8 = Move.create!(
  game: game_2,
  player: cee,
  position: 7
)

game_2_move_9 = Move.create!(
  game: game_2,
  player: jon,
  position: 8
)
