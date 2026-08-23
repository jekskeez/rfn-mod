package §_-33r§
{
   import §_-P2b§.§_-01l§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   
   public class §_-L2a§ extends §_-AP§
   {
      
      protected var packages:Array = null;
      
      protected var §_-sv§:Boolean = false;
      
      public function §_-L2a§(param1:Number, param2:Array, param3:Boolean)
      {
         super(param1);
         this.packages = param2;
         this.§_-sv§ = param3;
      }
      
      override public function set hero(param1:Hero) : void
      {
         var _loc2_:int = 0;
         if(param1 == null && this.hero != null)
         {
            this.hero.heroView.setClothing(this.hero.player["worn_packages"],this.hero.player["worn_accessories"]);
            if(this.§_-sv§)
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
            if(this.§_-sv§)
            {
               if(Game.toggle)
               {
                  _loc2_ = 0;
                  while(_loc2_ < param1.perkController.perksClothes.length)
                  {
                     param1.perkController.perksClothes[_loc2_].isBlock = true;
                     if(!(!(param1.perkController.perksClothes[_loc2_] is §_-01l§) || !param1.perkController.perksClothes[_loc2_].active))
                     {
                        param1.perkController.perksClothes[_loc2_].active = false;
                        Connection.§_-Li§(§_-h2B§.§_-w1R§,param1.perkController.perksClothes[_loc2_].§_-i2D§,0,0,"");
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

