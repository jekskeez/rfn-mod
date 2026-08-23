package §_-Cc§
{
   import §_-j2E§.§_-x1v§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   
   public class §_-kj§ extends §_-pp§
   {
      
      protected var packages:Array = null;
      
      protected var §_-u2Q§:Boolean = false;
      
      public function §_-kj§(param1:Number, param2:Array, param3:Boolean)
      {
         super(param1);
         this.packages = param2;
         this.§_-u2Q§ = param3;
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:int = 0;
         if(param1 == null && this.hero != null)
         {
            this.hero.heroView.setClothing(this.hero.player["worn_packages"],this.hero.player["worn_accessories"]);
            if(this.§_-u2Q§)
            {
               _loc2_ = 0;
               while(_loc2_ < this.hero.perkController.perksClothes.length)
               {
                  this.hero.perkController.perksClothes[_loc2_].isBlock = false;
                  _loc2_++;
               }
            }
         }
         else
         {
            if(this.§_-u2Q§)
            {
               if(Game.toggle)
               {
                  _loc2_ = 0;
                  while(_loc2_ < param1.perkController.perksClothes.length)
                  {
                     param1.perkController.perksClothes[_loc2_].isBlock = true;
                     if(!(!(param1.perkController.perksClothes[_loc2_] is §_-x1v§) || !param1.perkController.perksClothes[_loc2_].active))
                     {
                        param1.perkController.perksClothes[_loc2_].active = false;
                        Connection.§_-e2T§(§_-u1O§.§_-C1i§,param1.perkController.perksClothes[_loc2_].§_-T2a§,0,0,"");
                     }
                     _loc2_++;
                  }
               }
            }
            param1.heroView.setClothing(this.packages);
         }
         super.hero = param1;
      }
   }
}

