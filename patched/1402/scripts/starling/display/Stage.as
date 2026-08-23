package starling.display
{
   import §_-f1T§.Event;
   import §_-f1T§.§_-K1M§;
   import flash.display.BitmapData;
   import flash.errors.IllegalOperationError;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import starling.core.Starling;
   import starling.core.§_-wz§;
   import starling.core.starling_internal;
   import starling.filters.FragmentFilter;
   import starling.utils.§_-r1p§;
   
   use namespace starling_internal;
   
   public class Stage extends DisplayObjectContainer
   {
      
      private static var §_-7w§:Matrix3D = new Matrix3D();
      
      private var §_-sd§:int;
      
      private var §_-Pb§:int;
      
      private var §_-21g§:uint;
      
      private var §_-82f§:Number;
      
      private var §_-fa§:Point;
      
      private var §_-T1A§:Vector3D;
      
      private var §_-62g§:§_-K1M§;
      
      private var §_-w1p§:Vector.<DisplayObject>;
      
      public function Stage(param1:int, param2:int, param3:uint = 0)
      {
         super();
         this.§_-sd§ = param1;
         this.§_-Pb§ = param2;
         this.§_-21g§ = param3;
         this.§_-82f§ = 1;
         this.§_-fa§ = new Point();
         this.§_-T1A§ = new Vector3D();
         this.§_-62g§ = new §_-K1M§(Event.ENTER_FRAME,0);
         this.§_-w1p§ = new Vector.<DisplayObject>(0);
      }
      
      public function §_-a1Q§(param1:Number) : void
      {
         this.§_-62g§.reset(Event.ENTER_FRAME,false,param1);
         §_-EE§(this.§_-62g§);
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(param2 && (!visible || !touchable))
         {
            return null;
         }
         if(param1.x < 0 || param1.x > this.§_-sd§ || param1.y < 0 || param1.y > this.§_-Pb§)
         {
            return null;
         }
         var _loc3_:DisplayObject = super.hitTest(param1,param2);
         if(_loc3_ == null)
         {
            _loc3_ = this;
         }
         return _loc3_;
      }
      
      public function drawToBitmapData(param1:BitmapData = null, param2:Boolean = true) : BitmapData
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:§_-wz§ = new §_-wz§();
         var _loc4_:Starling = Starling.§_-n1s§;
         if(param1 == null)
         {
            _loc5_ = _loc4_.§_-6I§ * _loc4_.§_-a2T§;
            _loc6_ = _loc4_.§_-G2h§ * _loc4_.§_-a2T§;
            param1 = new BitmapData(_loc5_,_loc6_,param2);
         }
         _loc3_.renderTarget = null;
         _loc3_.§_-L1j§(0,0,this.§_-sd§,this.§_-Pb§,this.§_-sd§,this.§_-Pb§,this.§_-oy§);
         if(param2)
         {
            _loc3_.clear();
         }
         else
         {
            _loc3_.clear(this.§_-21g§,1);
         }
         render(_loc3_,1);
         _loc3_.§_-z24§();
         _loc3_.dispose();
         Starling.§_-n1s§.context.drawToBitmapData(param1);
         Starling.§_-n1s§.context.present();
         return param1;
      }
      
      public function §_-S28§(param1:DisplayObject = null, param2:Vector3D = null) : Vector3D
      {
         getTransformationMatrix3D(param1,§_-7w§);
         return §_-r1p§.transformCoords3D(§_-7w§,this.§_-sd§ / 2 + this.§_-fa§.x,this.§_-Pb§ / 2 + this.§_-fa§.y,-this.§_-b1D§,param2);
      }
      
      internal function §_-W1U§(param1:DisplayObject) : void
      {
         this.§_-w1p§.push(param1);
      }
      
      internal function §_-f1O§(param1:DisplayObject) : void
      {
         var _loc2_:int = this.§_-w1p§.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.§_-w1p§.splice(_loc2_,1);
         }
      }
      
      override internal function §_-x24§(param1:DisplayObject, param2:String, param3:Vector.<DisplayObject>) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2 == Event.ENTER_FRAME && param1 == this)
         {
            _loc4_ = 0;
            _loc5_ = int(this.§_-w1p§.length);
            while(_loc4_ < _loc5_)
            {
               param3[param3.length] = this.§_-w1p§[_loc4_];
               _loc4_++;
            }
         }
         else
         {
            super.§_-x24§(param1,param2,param3);
         }
      }
      
      override public function set width(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot set width of stage");
      }
      
      override public function set height(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot set height of stage");
      }
      
      override public function set x(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot set x-coordinate of stage");
      }
      
      override public function set y(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot set y-coordinate of stage");
      }
      
      override public function set scaleX(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot scale stage");
      }
      
      override public function set scaleY(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot scale stage");
      }
      
      override public function set rotation(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot rotate stage");
      }
      
      override public function set skewX(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot skew stage");
      }
      
      override public function set skewY(param1:Number) : void
      {
         throw new IllegalOperationError("Cannot skew stage");
      }
      
      override public function set filter(param1:FragmentFilter) : void
      {
         throw new IllegalOperationError("Cannot add filter to stage. Add it to \'root\' instead!");
      }
      
      public function get color() : uint
      {
         return this.§_-21g§;
      }
      
      public function set color(param1:uint) : void
      {
         this.§_-21g§ = param1;
      }
      
      public function get stageWidth() : int
      {
         return this.§_-sd§;
      }
      
      public function set stageWidth(param1:int) : void
      {
         this.§_-sd§ = param1;
      }
      
      public function get stageHeight() : int
      {
         return this.§_-Pb§;
      }
      
      public function set stageHeight(param1:int) : void
      {
         this.§_-Pb§ = param1;
      }
      
      public function get §_-b1D§() : Number
      {
         return this.§_-sd§ / (2 * Math.tan(this.§_-82f§ / 2));
      }
      
      public function set §_-b1D§(param1:Number) : void
      {
         this.§_-82f§ = 2 * Math.atan(this.stageWidth / (2 * param1));
      }
      
      public function get §_-G22§() : Number
      {
         return this.§_-82f§;
      }
      
      public function set §_-G22§(param1:Number) : void
      {
         this.§_-82f§ = param1;
      }
      
      public function get §_-I1G§() : Point
      {
         return this.§_-fa§;
      }
      
      public function set §_-I1G§(param1:Point) : void
      {
         this.§_-fa§.setTo(param1.x,param1.y);
      }
      
      public function get §_-oy§() : Vector3D
      {
         return this.§_-S28§(null,this.§_-T1A§);
      }
   }
}

