package §_-c2C§
{
   import §_-I2Y§.§_-91K§;
   import §_-l2u§.§_-62b§;
   import events.EditorEvent;
   import events.GameEvent;
   import flash.events.Event;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-s2l§;
   import utils.§_-33I§;
   import views.§_-aW§;
   
   public class §_-H1k§ extends Screen implements §_-91K§
   {
      
      private static var _instance:§_-H1k§;
      
      public static var §_-t1y§:Object = {};
      
      public var game:SquirrelGame = null;
      
      public function §_-H1k§()
      {
         _instance = this;
         super();
      }
      
      public static function get instance() : §_-H1k§
      {
         return _instance;
      }
      
      override public function show() : void
      {
         super.show();
         §_-aW§.instance.open();
         this.game = new §_-62b§();
         this.§_-s1C§();
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-s2U§);
         this.§_-s2U§();
         if(§_-33I§.§_-V1O§(Game.rights,§_-33I§.§_-9F§))
         {
            this.§_-E1v§.§_-h1K§();
         }
         else
         {
            this.§_-E1v§.§_-O1A§();
         }
      }
      
      override public function hide() : void
      {
         if(!this.game)
         {
            return;
         }
         §_-73Q§.removeEventListener(§_-73Q§.§_-J1D§,this.§_-s2U§);
         this.§_-42D§();
         this.game.dispose();
         this.game = null;
         super.hide();
      }
      
      public function §_-ji§(param1:int, param2:int, param3:String = null) : void
      {
         if(!this.game || this.§_-E1v§.§_-nW§)
         {
            return;
         }
         this.§_-E1v§.§_-ji§(param1,param2,param3);
         this.§_-E1v§.§_-Lw§();
      }
      
      private function get §_-E1v§() : §_-62b§
      {
         return this.game as §_-62b§;
      }
      
      private function §_-s1C§() : void
      {
         addChild(this.game);
         §_-817§.§_-X2a§.addChild(this.game.getStarlingView());
         Connection.listen(this.§_-E1v§.§_-x2f§,[§_-s2l§.§_-02u§,§_-s2l§.§_-T10§]);
         Game.listen(this.§_-E1v§.§_-Y16§);
         Game.§_-53O§(GameEvent.CONNECTION_CLOSED,this.§_-E1v§.§_-pw§);
         this.§_-E1v§.§_-63x§.addEventListener(EditorEvent.MODE_CHANGED,this.§_-52g§);
         this.§_-E1v§.§_-63x§.addEventListener(EditorEvent.LOCATION_CHANGED,this.§_-52g§);
         this.§_-E1v§.§_-63x§.addEventListener(EditorEvent.SUBLOCATION_CHANGED,this.§_-52g§);
      }
      
      private function §_-42D§() : void
      {
         Connection.forget(this.§_-E1v§.§_-x2f§,[§_-s2l§.§_-02u§,§_-s2l§.§_-T10§]);
         Game.forget(this.§_-E1v§.§_-Y16§);
         Game.§_-72j§(GameEvent.CONNECTION_CLOSED,this.§_-E1v§.§_-pw§);
         this.§_-E1v§.§_-63x§.removeEventListener(EditorEvent.MODE_CHANGED,this.§_-52g§);
         this.§_-E1v§.§_-63x§.removeEventListener(EditorEvent.LOCATION_CHANGED,this.§_-52g§);
         this.§_-E1v§.§_-63x§.removeEventListener(EditorEvent.SUBLOCATION_CHANGED,this.§_-52g§);
         if(Boolean(this.game.getStarlingView()) && §_-817§.§_-X2a§.contains(this.game.getStarlingView()))
         {
            §_-817§.§_-X2a§.removeChild(this.game.getStarlingView());
         }
         if(contains(this.game))
         {
            removeChild(this.game);
         }
      }
      
      private function §_-52g§(param1:EditorEvent) : void
      {
         this.§_-ji§(param1.location,param1.mode);
      }
      
      private function §_-s2U§(param1:Event = null) : void
      {
         if(!this.game)
         {
            return;
         }
         this.§_-E1v§.§_-63x§.placeInCenter();
         this.§_-E1v§.§_-S1A§.placeInCenter();
         this.§_-E1v§.§_-s2U§();
      }
   }
}

