package §_-T2y§
{
   import §_-Rj§.§_-A32§;
   import §_-Y22§.§_-E1J§;
   import events.EditorEvent;
   import events.GameEvent;
   import flash.events.Event;
   import game.mainGame.SquirrelGame;
   import protocol.Connection;
   import protocol.§_-S2I§;
   import utils.§_-c10§;
   import views.§_-Vm§;
   
   public class §_-P1Y§ extends Screen implements §_-E1J§
   {
      
      private static var _instance:§_-P1Y§;
      
      public static var §_-Vx§:Object = {};
      
      public var game:SquirrelGame = null;
      
      public function §_-P1Y§()
      {
         _instance = this;
         super();
      }
      
      public static function get instance() : §_-P1Y§
      {
         return _instance;
      }
      
      override public function show() : void
      {
         super.show();
         §_-Vm§.instance.open();
         this.game = new §_-A32§();
         this.§_-71M§();
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-o1t§);
         this.§_-o1t§();
         if(§_-c10§.§_-73j§(Game.rights,§_-c10§.§_-C2Y§))
         {
            this.§_-l26§.§_-q1u§();
         }
         else
         {
            this.§_-l26§.§_-m1Q§();
         }
      }
      
      override public function hide() : void
      {
         if(!this.game)
         {
            return;
         }
         §_-K1r§.removeEventListener(§_-K1r§.§_-n2V§,this.§_-o1t§);
         this.§_-P1R§();
         this.game.dispose();
         this.game = null;
         super.hide();
      }
      
      public function §_-M2Y§(param1:int, param2:int, param3:String = null) : void
      {
         if(!this.game || this.§_-l26§.§_-uo§)
         {
            return;
         }
         this.§_-l26§.§_-M2Y§(param1,param2,param3);
         this.§_-l26§.§_-i2o§();
      }
      
      private function get §_-l26§() : §_-A32§
      {
         return this.game as §_-A32§;
      }
      
      private function §_-71M§() : void
      {
         addChild(this.game);
         §_-s1i§.§_-831§.addChild(this.game.getStarlingView());
         Connection.listen(this.§_-l26§.§_-o2C§,[§_-S2I§.§_-pN§,§_-S2I§.§_-9G§]);
         Game.listen(this.§_-l26§.§_-P9§);
         Game.§_-Y2s§(GameEvent.CONNECTION_CLOSED,this.§_-l26§.§_-i1c§);
         this.§_-l26§.§_-v1P§.addEventListener(EditorEvent.MODE_CHANGED,this.§_-ke§);
         this.§_-l26§.§_-v1P§.addEventListener(EditorEvent.LOCATION_CHANGED,this.§_-ke§);
         this.§_-l26§.§_-v1P§.addEventListener(EditorEvent.SUBLOCATION_CHANGED,this.§_-ke§);
      }
      
      private function §_-P1R§() : void
      {
         Connection.forget(this.§_-l26§.§_-o2C§,[§_-S2I§.§_-pN§,§_-S2I§.§_-9G§]);
         Game.forget(this.§_-l26§.§_-P9§);
         Game.§_-R1D§(GameEvent.CONNECTION_CLOSED,this.§_-l26§.§_-i1c§);
         this.§_-l26§.§_-v1P§.removeEventListener(EditorEvent.MODE_CHANGED,this.§_-ke§);
         this.§_-l26§.§_-v1P§.removeEventListener(EditorEvent.LOCATION_CHANGED,this.§_-ke§);
         this.§_-l26§.§_-v1P§.removeEventListener(EditorEvent.SUBLOCATION_CHANGED,this.§_-ke§);
         if(Boolean(this.game.getStarlingView()) && §_-s1i§.§_-831§.contains(this.game.getStarlingView()))
         {
            §_-s1i§.§_-831§.removeChild(this.game.getStarlingView());
         }
         if(contains(this.game))
         {
            removeChild(this.game);
         }
      }
      
      private function §_-ke§(param1:EditorEvent) : void
      {
         this.§_-M2Y§(param1.location,param1.mode);
      }
      
      private function §_-o1t§(param1:Event = null) : void
      {
         if(!this.game)
         {
            return;
         }
         this.§_-l26§.§_-v1P§.placeInCenter();
         this.§_-l26§.§_-OO§.placeInCenter();
         this.§_-l26§.§_-o1t§();
      }
   }
}

