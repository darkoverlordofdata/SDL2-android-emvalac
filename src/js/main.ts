import { get_version, CreateWindow } from 'Sdx'

module example {

  function main() {

    console.log(`This is a test ${get_version()}`)
    let window = CreateWindow(200, 200, "Hello World")
    // let game = CreateGame(window)
    // game.Start();
    // while (Sdx.running) {
    //   Sdx.GameLoop(game);
    // }
  

  }


  main()
}