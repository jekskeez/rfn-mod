package §_-j2H§
{
   import Box2D.Dynamics.b2FixtureDef;
   import flash.display.DisplayObject;
   import game.mainGame.§_-q2c§;
   
   public class §_-PJ§ extends §_-a2Q§
   {
      
      private static const §_-53X§:uint = 1;
      
      private static const §_-C3c§:uint = §_-q2c§.§_-wI§ | §_-q2c§.§_-Dx§ | §_-q2c§.§_-rT§;
      
      private static const §_-ql§:b2FixtureDef = new b2FixtureDef(null,null,0.1,0.1,500,§_-53X§,§_-C3c§,0);
      
      public function §_-PJ§(param1:DisplayObject = null, param2:b2FixtureDef = null, param3:Number = NaN, param4:Number = NaN)
      {
         param1 = param1 ? param1 : new MountIcedView();
         param2 = param2 ? param2 : §_-ql§;
         param3 = !isNaN(param3) ? param3 : §_-V2H§;
         param4 = !isNaN(param4) ? param4 : §_-V2H§;
         super(param1,param2,param3,param4);
      }
      
      override public function get landSound() : String
      {
         return "land_ice";
      }
   }
}

