package utils
{
   import §_-42B§.§_-y2k§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class §_-m1H§ extends Sprite
   {
      
      private var §_-d2y§:DisplayObject = null;
      
      private var §_-JV§:DisplayObject = null;
      
      private var §_-j1R§:DisplayObject = null;
      
      private var §_-3X§:int;
      
      private var §_-a12§:int;
      
      private var §_-o2A§:int;
      
      private var §_-L11§:Boolean = false;
      
      private var §_-Rd§:int = 0;
      
      private var §_-g2T§:int = 0;
      
      public function §_-m1H§(param1:Array, param2:Boolean = false)
      {
         super();
         this.init(param1,param2);
      }
      
      public function §_-g1E§(param1:Boolean) : void
      {
         if(!this.§_-j1R§)
         {
            return;
         }
         this.§_-L11§ = param1;
         if(this.§_-L11§)
         {
            this.§_-j1R§.width = this.§_-JV§.width;
         }
         else
         {
            this.§_-JV§.width = this.§_-j1R§.width;
         }
         this.§_-j1R§.visible = this.§_-L11§;
         this.§_-JV§.visible = !this.§_-L11§;
         this.§_-B1n§(this.§_-Rd§,this.§_-g2T§);
      }
      
      public function §_-41n§() : int
      {
         return this.§_-L11§ ? int(this.§_-j1R§.width) : int(this.§_-JV§.width);
      }
      
      public function §_-B1n§(param1:int, param2:int, param3:Number = 0.5) : void
      {
         this.§_-Rd§ = param1;
         this.§_-g2T§ = param2;
         if(this.§_-g2T§ < this.§_-Rd§)
         {
            this.§_-Rd§ = this.§_-g2T§;
         }
         var _loc4_:int = this.§_-L11§ ? this.§_-o2A§ : this.§_-a12§;
         var _loc5_:DisplayObject = this.§_-L11§ ? this.§_-j1R§ : this.§_-JV§;
         var _loc6_:Number = _loc4_ * (this.§_-Rd§ / this.§_-g2T§);
         §_-y2k§.to(_loc5_,param3,{"width":_loc6_});
      }
      
      private function init(param1:Array, param2:Boolean) : void
      {
         this.§_-O14§(param1[0]["image"],param1[0]["X"],param1[0]["Y"]);
         this.§_-03z§(param1[1]["image"],param1[1]["X"],param1[1]["Y"]);
         this.§_-a12§ = param1[1]["width"];
         if(param1.length > 2)
         {
            this.§_-5w§(param1[2]["image"],param1[2]["X"],param1[2]["Y"]);
            this.§_-o2A§ = param1[2]["width"];
         }
         this.§_-B1n§(0,1,0);
         this.§_-3X§ = param1[1]["X"];
         if(param2)
         {
            addChild(this.§_-d2y§);
         }
      }
      
      private function §_-O14§(param1:DisplayObject, param2:int, param3:int) : void
      {
         this.§_-d2y§ = param1;
         this.§_-d2y§.x = param2;
         this.§_-d2y§.y = param3;
         addChild(this.§_-d2y§);
      }
      
      private function §_-03z§(param1:DisplayObject, param2:int, param3:int) : void
      {
         this.§_-JV§ = param1;
         this.§_-JV§.x = param2;
         this.§_-JV§.y = param3;
         addChild(this.§_-JV§);
      }
      
      private function §_-5w§(param1:DisplayObject, param2:int, param3:int) : void
      {
         this.§_-j1R§ = param1;
         this.§_-j1R§.x = param2;
         this.§_-j1R§.y = param3;
         this.§_-j1R§.visible = false;
         addChild(this.§_-j1R§);
      }
   }
}

