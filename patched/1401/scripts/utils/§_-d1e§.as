package utils
{
   import §_-dc§.§_-d1q§;
   import flash.display.Sprite;
   import flash.filters.GlowFilter;
   import flash.text.TextFormat;
   
   public class §_-d1e§ extends §_-w2v§
   {
      
      private var §_-01d§:TotemRedStar = null;
      
      private var §_-01D§:TotemRedStar = null;
      
      private var §_-93P§:§_-22V§ = null;
      
      private var §_-AI§:§_-22V§ = null;
      
      public function §_-d1e§(param1:int)
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
         var _loc5_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,9,16777215,true);
         this.§_-01d§ = new TotemRedStar();
         this.§_-01d§.x = 0;
         this.§_-01d§.y = 5;
         addChild(this.§_-01d§);
         this.§_-01D§ = new TotemRedStar();
         this.§_-01D§.x = param1 + 2;
         this.§_-01D§.y = 5;
         addChild(this.§_-01D§);
         this.§_-93P§ = new §_-22V§("",this.§_-01d§.x - 5,this.§_-01d§.y - 4,_loc5_);
         this.§_-93P§.filters = [new GlowFilter(6243876,1,1,2,3.5)];
         addChild(this.§_-93P§);
         this.§_-AI§ = new §_-22V§("",this.§_-01D§.x - 5,this.§_-01D§.y - 4,_loc5_);
         this.§_-AI§.filters = [new GlowFilter(6243876,1,1,2,3.5)];
         addChild(this.§_-AI§);
      }
      
      public function setExperience(param1:int, param2:int, param3:int) : void
      {
         if(param1 == §_-d1q§.§_-F2G§)
         {
            param2 = param3;
            param1--;
         }
         super.§_-B1n§(param2,param3);
         this.§_-93P§.text = String(param1);
         this.§_-93P§.x = this.§_-01d§.x - this.§_-93P§.width * 0.5;
         this.§_-AI§.text = String(param1 + 1);
         this.§_-AI§.x = this.§_-01D§.x - this.§_-AI§.width * 0.5;
      }
   }
}

