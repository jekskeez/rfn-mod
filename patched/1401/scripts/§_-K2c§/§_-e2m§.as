package §_-K2c§
{
   import flash.geom.Point;
   import starling.core.starling_internal;
   import starling.display.DisplayObject;
   import starling.utils.formatString;
   
   use namespace starling_internal;
   
   public class §_-e2m§
   {
      
      private static var §_-G2g§:Point = new Point();
      
      private var §_-O1J§:int;
      
      private var §_-s1I§:Number;
      
      private var §_-Wy§:Number;
      
      private var §_-d1p§:Number;
      
      private var §_-v2y§:Number;
      
      private var §_-y2§:int;
      
      private var §_-QK§:String;
      
      private var §_-e2X§:DisplayObject;
      
      private var §_-03o§:Number;
      
      private var §_-33m§:Number;
      
      private var §_-q1a§:Number;
      
      private var §_-D1k§:Number;
      
      private var §_-41i§:Boolean;
      
      private var §_-Z1R§:Vector.<EventDispatcher>;
      
      public function §_-e2m§(param1:int)
      {
         super();
         this.§_-O1J§ = param1;
         this.§_-y2§ = 0;
         this.§_-QK§ = §_-sj§.§_-X2J§;
         this.§_-33m§ = this.§_-q1a§ = this.§_-D1k§ = 1;
         this.§_-Z1R§ = new Vector.<EventDispatcher>(0);
      }
      
      public function §_-l29§(param1:DisplayObject, param2:Point = null) : Point
      {
         §_-G2g§.setTo(this.§_-s1I§,this.§_-Wy§);
         return param1.globalToLocal(§_-G2g§,param2);
      }
      
      public function §_-v1X§(param1:DisplayObject, param2:Point = null) : Point
      {
         §_-G2g§.setTo(this.§_-d1p§,this.§_-v2y§);
         return param1.globalToLocal(§_-G2g§,param2);
      }
      
      public function §_-s1N§(param1:DisplayObject, param2:Point = null) : Point
      {
         if(param2 == null)
         {
            param2 = new Point();
         }
         this.§_-l29§(param1,param2);
         var _loc3_:Number = param2.x;
         var _loc4_:Number = param2.y;
         this.§_-v1X§(param1,param2);
         param2.setTo(_loc3_ - param2.x,_loc4_ - param2.y);
         return param2;
      }
      
      public function §_-LH§(param1:DisplayObject) : Boolean
      {
         return this.§_-Z1R§.indexOf(param1) != -1;
      }
      
      public function toString() : String
      {
         return formatString("Touch {0}: globalX={1}, globalY={2}, phase={3}",this.§_-O1J§,this.§_-s1I§,this.§_-Wy§,this.§_-QK§);
      }
      
      public function clone() : §_-e2m§
      {
         var _loc1_:§_-e2m§ = new §_-e2m§(this.§_-O1J§);
         _loc1_.§_-s1I§ = this.§_-s1I§;
         _loc1_.§_-Wy§ = this.§_-Wy§;
         _loc1_.§_-d1p§ = this.§_-d1p§;
         _loc1_.§_-v2y§ = this.§_-v2y§;
         _loc1_.§_-QK§ = this.§_-QK§;
         _loc1_.§_-y2§ = this.§_-y2§;
         _loc1_.§_-03o§ = this.§_-03o§;
         _loc1_.§_-33m§ = this.§_-33m§;
         _loc1_.§_-q1a§ = this.§_-q1a§;
         _loc1_.§_-D1k§ = this.§_-D1k§;
         _loc1_.§_-41i§ = this.§_-41i§;
         _loc1_.target = this.§_-e2X§;
         return _loc1_;
      }
      
      private function §_-m22§() : void
      {
         var _loc1_:* = 0;
         var _loc2_:DisplayObject = null;
         if(this.§_-e2X§)
         {
            _loc1_ = 1;
            _loc2_ = this.§_-e2X§;
            this.§_-Z1R§.length = 1;
            this.§_-Z1R§[0] = _loc2_;
            while(true)
            {
               _loc2_ = _loc2_.parent;
               if(_loc2_ == null)
               {
                  break;
               }
               this.§_-Z1R§[int(_loc1_++)] = _loc2_;
            }
         }
         else
         {
            this.§_-Z1R§.length = 0;
         }
      }
      
      public function get id() : int
      {
         return this.§_-O1J§;
      }
      
      public function get §_-6R§() : Number
      {
         return this.§_-d1p§;
      }
      
      public function get §_-92C§() : Number
      {
         return this.§_-v2y§;
      }
      
      public function get §_-n2h§() : Number
      {
         return this.§_-s1I§;
      }
      
      public function set §_-n2h§(param1:Number) : void
      {
         this.§_-d1p§ = this.§_-s1I§ != this.§_-s1I§ ? param1 : this.§_-s1I§;
         this.§_-s1I§ = param1;
      }
      
      public function get §_-Zv§() : Number
      {
         return this.§_-Wy§;
      }
      
      public function set §_-Zv§(param1:Number) : void
      {
         this.§_-v2y§ = this.§_-Wy§ != this.§_-Wy§ ? param1 : this.§_-Wy§;
         this.§_-Wy§ = param1;
      }
      
      public function get §_-l2B§() : int
      {
         return this.§_-y2§;
      }
      
      public function set §_-l2B§(param1:int) : void
      {
         this.§_-y2§ = param1;
      }
      
      public function get §_-Q2S§() : String
      {
         return this.§_-QK§;
      }
      
      public function set §_-Q2S§(param1:String) : void
      {
         this.§_-QK§ = param1;
      }
      
      public function get target() : DisplayObject
      {
         return this.§_-e2X§;
      }
      
      public function set target(param1:DisplayObject) : void
      {
         if(this.§_-e2X§ != param1)
         {
            this.§_-e2X§ = param1;
            this.§_-m22§();
         }
      }
      
      public function get §_-n2B§() : Number
      {
         return this.§_-03o§;
      }
      
      public function set §_-n2B§(param1:Number) : void
      {
         this.§_-03o§ = param1;
      }
      
      public function get pressure() : Number
      {
         return this.§_-33m§;
      }
      
      public function set pressure(param1:Number) : void
      {
         this.§_-33m§ = param1;
      }
      
      public function get width() : Number
      {
         return this.§_-q1a§;
      }
      
      public function set width(param1:Number) : void
      {
         this.§_-q1a§ = param1;
      }
      
      public function get height() : Number
      {
         return this.§_-D1k§;
      }
      
      public function set height(param1:Number) : void
      {
         this.§_-D1k§ = param1;
      }
      
      public function get §_-91e§() : Boolean
      {
         return this.§_-41i§;
      }
      
      public function set §_-91e§(param1:Boolean) : void
      {
         this.§_-41i§ = param1;
      }
      
      internal function dispatchEvent(param1:TouchEvent) : void
      {
         if(this.§_-e2X§)
         {
            param1.dispatch(this.§_-Z1R§);
         }
      }
      
      internal function get bubbleChain() : Vector.<EventDispatcher>
      {
         return this.§_-Z1R§.concat();
      }
   }
}

