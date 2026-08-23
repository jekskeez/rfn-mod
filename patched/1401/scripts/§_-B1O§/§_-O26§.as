package §_-B1O§
{
   import Box2D.Dynamics.b2FixtureDef;
   import flash.display.DisplayObject;
   import game.mainGame.§_-V§;
   
   public class §_-O26§ extends §_-O2a§
   {
      
      private static const §_-52X§:uint = 1;
      
      private static const §_-FN§:uint = §_-V§.§_-j1I§ | §_-V§.§_-9H§ | §_-V§.§_-qV§;
      
      private static const §_-03A§:b2FixtureDef = new b2FixtureDef(null,null,0.1,0.1,500,§_-52X§,§_-FN§,0);
      
      public function §_-O26§(param1:DisplayObject = null, param2:b2FixtureDef = null, param3:Number = NaN, param4:Number = NaN)
      {
         param1 = param1 ? param1 : new MountIcedView();
         param2 = param2 ? param2 : §_-03A§;
         param3 = !isNaN(param3) ? param3 : §_-T2h§;
         param4 = !isNaN(param4) ? param4 : §_-T2h§;
         super(param1,param2,param3,param4);
      }
      
      override public function get landSound() : String
      {
         return "land_ice";
      }
   }
}

