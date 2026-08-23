package utils
{
   import §_-22D§.§_-C2E§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class §_-8p§ extends Sprite
   {
      
      protected var §_-33R§:DisplayObject = null;
      
      protected var §_-23X§:DisplayObject = null;
      
      protected var §_-sV§:DisplayObject = null;
      
      private var §_-Ht§:int;
      
      private var §_-bX§:int;
      
      private var §_-E1x§:int;
      
      private var §_-n1Y§:int;
      
      public var reverse:Boolean = false;
      
      public var min:int = 0;
      
      public function §_-8p§(param1:Array, param2:int, param3:Boolean = false)
      {
         super();
         this.init(param1,param2,param3);
      }
      
      public function §_-o2S§(param1:DisplayObject, param2:int, param3:int) : void
      {
         if(this.§_-23X§ != null && contains(this.§_-23X§))
         {
            removeChild(this.§_-23X§);
         }
         this.§_-23X§ = param1;
         this.§_-23X§.x = param2;
         this.§_-23X§.y = param3;
         addChild(this.§_-23X§);
         if(this.§_-sV§ != null)
         {
            this.§_-23X§.mask = this.§_-sV§;
         }
      }
      
      public function init(param1:Array, param2:int, param3:Boolean) : void
      {
         var _loc4_:Sprite = null;
         this.§_-n1Y§ = param2;
         this.§_-n2w§(param1[0]["image"],param1[0]["X"],param1[0]["Y"]);
         this.§_-131§(param1[1]["image"],param1[1]["X"],param1[1]["Y"]);
         if(!(2 in param1) || param1[2] == null)
         {
            _loc4_ = new Sprite();
            _loc4_.graphics.beginFill(0,1);
            _loc4_.graphics.drawRect(0,0,this.§_-23X§.width,this.§_-23X§.height);
            this.§_-J2z§(_loc4_,param1[1]["X"],param1[1]["Y"]);
         }
         else
         {
            this.§_-J2z§(param1[2]["image"],param1[2]["X"],param1[2]["Y"]);
         }
         this.§_-d1Z§(0,1,0);
         this.§_-E1x§ = param1[1]["X"];
         if(param3)
         {
            swapChildren(this.§_-33R§,this.§_-23X§);
         }
      }
      
      public function §_-d1Z§(param1:int, ... rest) : void
      {
         var _loc3_:Number = 0.5;
         this.§_-bX§ = param1;
         if(rest.length >= 1)
         {
            this.§_-Ht§ = rest[0];
         }
         if(rest.length >= 2)
         {
            _loc3_ = Number(rest[1]);
         }
         if(this.§_-Ht§ == 0)
         {
            this.§_-Ht§ = 1;
         }
         if(this.§_-Ht§ < this.§_-bX§)
         {
            this.§_-bX§ = this.§_-Ht§;
         }
         var _loc4_:Number = this.§_-E1x§ + this.§_-n1Y§ * (1 - this.§_-bX§ / this.§_-Ht§);
         if(this.reverse)
         {
            §_-C2E§.to(this.§_-sV§,_loc3_,{
               "x":_loc4_,
               "scaleX":this.§_-bX§ / this.§_-Ht§
            });
         }
         if(!this.reverse)
         {
            §_-C2E§.to(this.§_-sV§,_loc3_,{"scaleX":this.§_-Z2t§()});
         }
      }
      
      public function get §_-V1R§() : int
      {
         return this.§_-sV§.width * this.§_-Z2t§();
      }
      
      private function §_-Z2t§() : Number
      {
         var _loc1_:Number = this.§_-bX§ / this.§_-Ht§ + this.min / this.§_-Ht§;
         if(_loc1_ > 1)
         {
            _loc1_ = 1;
         }
         return _loc1_;
      }
      
      private function §_-n2w§(param1:DisplayObject, param2:int, param3:int) : void
      {
         this.§_-33R§ = param1;
         this.§_-33R§.x = param2;
         this.§_-33R§.y = param3;
         addChild(this.§_-33R§);
      }
      
      private function §_-131§(param1:DisplayObject, param2:int, param3:int) : void
      {
         this.§_-23X§ = param1;
         this.§_-23X§.x = param2;
         this.§_-23X§.y = param3;
         addChild(this.§_-23X§);
      }
      
      private function §_-J2z§(param1:DisplayObject, param2:int, param3:int) : void
      {
         this.§_-sV§ = param1;
         this.§_-sV§.x = param2;
         this.§_-sV§.y = param3;
         addChild(this.§_-sV§);
         this.§_-23X§.mask = this.§_-sV§;
      }
   }
}

