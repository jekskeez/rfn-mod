package utils
{
   import §_-U19§.§_-su§;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   
   public class §_-u1G§ extends §_-8p§
   {
      
      private var §_-Ku§:TotemRedStar = null;
      
      private var §_-Q2q§:TotemRedStar = null;
      
      private var §_-PV§:§_-i5§ = null;
      
      private var §_-Z2O§:§_-i5§ = null;
      
      public function §_-u1G§(param1:int)
      {
         var _loc2_:TotemEmptyProgressBar = new TotemEmptyProgressBar();
         _loc2_.scaleX = param1 / _loc2_.width;
         var _loc3_:TotemProgressBar = new TotemProgressBar();
         _loc3_.scaleX = param1 / _loc3_.width;
         var _loc4_:Sprite = new Sprite();
         _loc4_.graphics.beginFill(16777215);
         _loc4_.graphics.drawRect(0,0,_loc3_.width,_loc3_.height);
         _loc4_.graphics.endFill();
         super([{
            "image":_loc2_,
            "X":0,
            "Y":0
         },{
            "image":_loc3_,
            "X":0,
            "Y":0
         },{
            "image":_loc4_,
            "X":0,
            "Y":0
         }],param1);
         var _loc5_:TextFormat = new TextFormat(§_-i5§.§_-c10§,9,16777215,true);
         this.§_-Ku§ = new TotemRedStar();
         this.§_-Ku§.x = 0;
         this.§_-Ku§.y = 5;
         addChild(this.§_-Ku§);
         this.§_-Q2q§ = new TotemRedStar();
         this.§_-Q2q§.x = param1 + 2;
         this.§_-Q2q§.y = 5;
         addChild(this.§_-Q2q§);
         this.§_-PV§ = new §_-i5§("",this.§_-Ku§.x - 5,this.§_-Ku§.y - 4,_loc5_);
         this.§_-PV§.filters = [new GlowFilter(6243876,1,1,2,3.5)];
         addChild(this.§_-PV§);
         this.§_-Z2O§ = new §_-i5§("",this.§_-Q2q§.x - 5,this.§_-Q2q§.y - 4,_loc5_);
         this.§_-Z2O§.filters = [new GlowFilter(6243876,1,1,2,3.5)];
         addChild(this.§_-Z2O§);
      }
      
      public function setExperience(param1:int, param2:int, param3:int) : void
      {
         if(param1 == §_-su§.§_-R1U§)
         {
            param2 = param3;
            param1--;
         }
         super.§_-d1Z§(param2,param3);
         this.§_-PV§.text = String(param1);
         this.§_-PV§.x = this.§_-Ku§.x - this.§_-PV§.width * 0.5;
         this.§_-Z2O§.text = String(param1 + 1);
         this.§_-Z2O§.x = this.§_-Q2q§.x - this.§_-Z2O§.width * 0.5;
      }
   }
}

