package utils
{
   import §_-42B§.§_-y2k§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class §_-w2v§ extends Sprite
   {
      
      protected var §_-d2y§:DisplayObject = null;
      
      protected var §_-JV§:DisplayObject = null;
      
      protected var §_-M2B§:DisplayObject = null;
      
      private var §_-g2T§:int;
      
      private var §_-Rd§:int;
      
      private var §_-3X§:int;
      
      private var §_-c1U§:int;
      
      public var reverse:Boolean = false;
      
      public var min:int = 0;
      
      public function §_-w2v§(param1:Array, param2:int, param3:Boolean = false)
      {
         super();
         this.init(param1,param2,param3);
      }
      
      public function §_-vm§(param1:DisplayObject, param2:int, param3:int) : void
      {
         if(this.§_-JV§ != null && contains(this.§_-JV§))
         {
            removeChild(this.§_-JV§);
         }
         this.§_-JV§ = param1;
         this.§_-JV§.x = param2;
         this.§_-JV§.y = param3;
         addChild(this.§_-JV§);
         if(this.§_-M2B§ != null)
         {
            this.§_-JV§.mask = this.§_-M2B§;
         }
      }
      
      public function init(param1:Array, param2:int, param3:Boolean) : void
      {
         var _loc4_:Sprite = null;
         this.§_-c1U§ = param2;
         this.§_-O14§(param1[0]["image"],param1[0]["X"],param1[0]["Y"]);
         this.§_-03z§(param1[1]["image"],param1[1]["X"],param1[1]["Y"]);
         if(!(2 in param1) || param1[2] == null)
         {
            _loc4_ = new Sprite();
            _loc4_.graphics.beginFill(0,1);
            _loc4_.graphics.drawRect(0,0,this.§_-JV§.width,this.§_-JV§.height);
            this.§_-pR§(_loc4_,param1[1]["X"],param1[1]["Y"]);
         }
         else
         {
            this.§_-pR§(param1[2]["image"],param1[2]["X"],param1[2]["Y"]);
         }
         this.§_-B1n§(0,1,0);
         this.§_-3X§ = param1[1]["X"];
         if(param3)
         {
            swapChildren(this.§_-d2y§,this.§_-JV§);
         }
      }
      
      public function §_-B1n§(param1:int, ... rest) : void
      {
         var _loc3_:Number = 0.5;
         this.§_-Rd§ = param1;
         if(rest.length >= 1)
         {
            this.§_-g2T§ = rest[0];
         }
         if(rest.length >= 2)
         {
            _loc3_ = Number(rest[1]);
         }
         if(this.§_-g2T§ == 0)
         {
            this.§_-g2T§ = 1;
         }
         if(this.§_-g2T§ < this.§_-Rd§)
         {
            this.§_-Rd§ = this.§_-g2T§;
         }
         var _loc4_:Number = this.§_-3X§ + this.§_-c1U§ * (1 - this.§_-Rd§ / this.§_-g2T§);
         if(this.reverse)
         {
            §_-y2k§.to(this.§_-M2B§,_loc3_,{
               "x":_loc4_,
               "scaleX":this.§_-Rd§ / this.§_-g2T§
            });
         }
         if(!this.reverse)
         {
            §_-y2k§.to(this.§_-M2B§,_loc3_,{"scaleX":this.§_-o2r§()});
         }
      }
      
      public function get §_-U2o§() : int
      {
         return this.§_-M2B§.width * this.§_-o2r§();
      }
      
      private function §_-o2r§() : Number
      {
         var _loc1_:Number = this.§_-Rd§ / this.§_-g2T§ + this.min / this.§_-g2T§;
         if(_loc1_ > 1)
         {
            _loc1_ = 1;
         }
         return _loc1_;
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
      
      private function §_-pR§(param1:DisplayObject, param2:int, param3:int) : void
      {
         this.§_-M2B§ = param1;
         this.§_-M2B§.x = param2;
         this.§_-M2B§.y = param3;
         addChild(this.§_-M2B§);
         this.§_-JV§.mask = this.§_-M2B§;
      }
   }
}

