package §_-f1T§
{
   import flash.geom.Point;
   import starling.core.starling_internal;
   import starling.display.DisplayObject;
   import starling.utils.formatString;
   
   use namespace starling_internal;
   
   public class §_-J1a§
   {
      
      private static var §_-O§:Point = new Point();
      
      private var §_-jy§:int;
      
      private var §_-PA§:Number;
      
      private var §_-a2q§:Number;
      
      private var §_-hg§:Number;
      
      private var §_-FW§:Number;
      
      private var §_-J2S§:int;
      
      private var §_-w2r§:String;
      
      private var §_-t1s§:DisplayObject;
      
      private var §_-q2h§:Number;
      
      private var §_-K2C§:Number;
      
      private var §_-sd§:Number;
      
      private var §_-Pb§:Number;
      
      private var §_-j2e§:Boolean;
      
      private var §_-7p§:Vector.<EventDispatcher>;
      
      public function §_-J1a§(param1:int)
      {
         super();
         this.§_-jy§ = param1;
         this.§_-J2S§ = 0;
         this.§_-w2r§ = §_-01Z§.§_-zX§;
         this.§_-K2C§ = this.§_-sd§ = this.§_-Pb§ = 1;
         this.§_-7p§ = new Vector.<EventDispatcher>(0);
      }
      
      public function §_-13l§(param1:DisplayObject, param2:Point = null) : Point
      {
         §_-O§.setTo(this.§_-PA§,this.§_-a2q§);
         return param1.globalToLocal(§_-O§,param2);
      }
      
      public function §_-x2u§(param1:DisplayObject, param2:Point = null) : Point
      {
         §_-O§.setTo(this.§_-hg§,this.§_-FW§);
         return param1.globalToLocal(§_-O§,param2);
      }
      
      public function §_-N1M§(param1:DisplayObject, param2:Point = null) : Point
      {
         if(param2 == null)
         {
            param2 = new Point();
         }
         this.§_-13l§(param1,param2);
         var _loc3_:Number = param2.x;
         var _loc4_:Number = param2.y;
         this.§_-x2u§(param1,param2);
         param2.setTo(_loc3_ - param2.x,_loc4_ - param2.y);
         return param2;
      }
      
      public function §_-X1D§(param1:DisplayObject) : Boolean
      {
         return this.§_-7p§.indexOf(param1) != -1;
      }
      
      public function toString() : String
      {
         return formatString("Touch {0}: globalX={1}, globalY={2}, phase={3}",this.§_-jy§,this.§_-PA§,this.§_-a2q§,this.§_-w2r§);
      }
      
      public function clone() : §_-J1a§
      {
         var _loc1_:§_-J1a§ = new §_-J1a§(this.§_-jy§);
         _loc1_.§_-PA§ = this.§_-PA§;
         _loc1_.§_-a2q§ = this.§_-a2q§;
         _loc1_.§_-hg§ = this.§_-hg§;
         _loc1_.§_-FW§ = this.§_-FW§;
         _loc1_.§_-w2r§ = this.§_-w2r§;
         _loc1_.§_-J2S§ = this.§_-J2S§;
         _loc1_.§_-q2h§ = this.§_-q2h§;
         _loc1_.§_-K2C§ = this.§_-K2C§;
         _loc1_.§_-sd§ = this.§_-sd§;
         _loc1_.§_-Pb§ = this.§_-Pb§;
         _loc1_.§_-j2e§ = this.§_-j2e§;
         _loc1_.target = this.§_-t1s§;
         return _loc1_;
      }
      
      private function §_-q1M§() : void
      {
         var _loc1_:* = 0;
         var _loc2_:DisplayObject = null;
         if(this.§_-t1s§)
         {
            _loc1_ = 1;
            _loc2_ = this.§_-t1s§;
            this.§_-7p§.length = 1;
            this.§_-7p§[0] = _loc2_;
            while(true)
            {
               _loc2_ = _loc2_.parent;
               if(_loc2_ == null)
               {
                  break;
               }
               this.§_-7p§[int(_loc1_++)] = _loc2_;
            }
         }
         else
         {
            this.§_-7p§.length = 0;
         }
      }
      
      public function get id() : int
      {
         return this.§_-jy§;
      }
      
      public function get §_-D1t§() : Number
      {
         return this.§_-hg§;
      }
      
      public function get §_-k1X§() : Number
      {
         return this.§_-FW§;
      }
      
      public function get §_-ca§() : Number
      {
         return this.§_-PA§;
      }
      
      public function set §_-ca§(param1:Number) : void
      {
         this.§_-hg§ = this.§_-PA§ != this.§_-PA§ ? param1 : this.§_-PA§;
         this.§_-PA§ = param1;
      }
      
      public function get §_-n2z§() : Number
      {
         return this.§_-a2q§;
      }
      
      public function set §_-n2z§(param1:Number) : void
      {
         this.§_-FW§ = this.§_-a2q§ != this.§_-a2q§ ? param1 : this.§_-a2q§;
         this.§_-a2q§ = param1;
      }
      
      public function get §_-W2H§() : int
      {
         return this.§_-J2S§;
      }
      
      public function set §_-W2H§(param1:int) : void
      {
         this.§_-J2S§ = param1;
      }
      
      public function get §_-iR§() : String
      {
         return this.§_-w2r§;
      }
      
      public function set §_-iR§(param1:String) : void
      {
         this.§_-w2r§ = param1;
      }
      
      public function get target() : DisplayObject
      {
         return this.§_-t1s§;
      }
      
      public function set target(param1:DisplayObject) : void
      {
         if(this.§_-t1s§ != param1)
         {
            this.§_-t1s§ = param1;
            this.§_-q1M§();
         }
      }
      
      public function get §_-EK§() : Number
      {
         return this.§_-q2h§;
      }
      
      public function set §_-EK§(param1:Number) : void
      {
         this.§_-q2h§ = param1;
      }
      
      public function get pressure() : Number
      {
         return this.§_-K2C§;
      }
      
      public function set pressure(param1:Number) : void
      {
         this.§_-K2C§ = param1;
      }
      
      public function get width() : Number
      {
         return this.§_-sd§;
      }
      
      public function set width(param1:Number) : void
      {
         this.§_-sd§ = param1;
      }
      
      public function get height() : Number
      {
         return this.§_-Pb§;
      }
      
      public function set height(param1:Number) : void
      {
         this.§_-Pb§ = param1;
      }
      
      public function get §_-61F§() : Boolean
      {
         return this.§_-j2e§;
      }
      
      public function set §_-61F§(param1:Boolean) : void
      {
         this.§_-j2e§ = param1;
      }
      
      internal function dispatchEvent(param1:TouchEvent) : void
      {
         if(this.§_-t1s§)
         {
            param1.dispatch(this.§_-7p§);
         }
      }
      
      internal function get bubbleChain() : Vector.<EventDispatcher>
      {
         return this.§_-7p§.concat();
      }
   }
}

