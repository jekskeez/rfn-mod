package starling.display
{
   import §_-K2c§.Event;
   import §_-K2c§.§_-zT§;
   import flash.display.BitmapData;
   import flash.errors.IllegalOperationError;
   import flash.geom.Matrix3D;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import starling.core.Starling;
   import starling.core.§_-T2v§;
   import starling.core.starling_internal;
   import starling.filters.FragmentFilter;
   import starling.utils.§_-rI§;
   
   use namespace starling_internal;
   
   public class Stage extends DisplayObjectContainer
   {
      
      private static var §_-S19§:Matrix3D = new Matrix3D();
      
      private var §_-q1a§:int;
      
      private var §_-D1k§:int;
      
      private var §_-Vt§:uint;
      
      private var §_-p2p§:Number;
      
      private var §_-AN§:Point;
      
      private var §_-wO§:Vector3D;
      
      private var §_-rC§:§_-zT§;
      
      private var §_-53W§:Vector.<DisplayObject>;
      
      public function Stage(param1:int, param2:int, param3:uint = 0)
      {
         super();
         this.§_-q1a§ = param1;
         this.§_-D1k§ = param2;
         this.§_-Vt§ = param3;
         this.§_-p2p§ = 1;
         this.§_-AN§ = new Point();
         this.§_-wO§ = new Vector3D();
         this.§_-rC§ = new §_-zT§(Event.ENTER_FRAME,0);
         this.§_-53W§ = new Vector.<DisplayObject>(0);
      }
      
      public function §_-ld§(param1:Number) : void
      {
         this.§_-rC§.reset(Event.ENTER_FRAME,false,param1);
         §_-NI§(this.§_-rC§);
      }
      
      override public function hitTest(param1:Point, param2:Boolean = false) : DisplayObject
      {
         if(param2 && (!visible || !touchable))
         {
            return null;
         }
         if(param1.x < 0 || param1.x > this.§_-q1a§ || param1.y < 0 || param1.y > this.§_-D1k§)
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
         var _loc3_:§_-T2v§ = new §_-T2v§();
         var _loc4_:Starling = Starling.§_-y1l§;
         if(param1 == null)
         {
            _loc5_ = _loc4_.§_-03H§ * _loc4_.§_-vA§;
            _loc6_ = _loc4_.§_-kK§ * _loc4_.§_-vA§;
            param1 = new BitmapData(_loc5_,_loc6_,param2);
         }
         _loc3_.renderTarget = null;
         _loc3_.§_-w2Q§(0,0,this.§_-q1a§,this.§_-D1k§,this.§_-q1a§,this.§_-D1k§,this.§_-tJ§);
         if(param2)
         {
            _loc3_.clear();
         }
         else
         {
            _loc3_.clear(this.§_-Vt§,1);
         }
         render(_loc3_,1);
         _loc3_.§_-A1U§();
         _loc3_.dispose();
         Starling.§_-y1l§.context.drawToBitmapData(param1);
         Starling.§_-y1l§.context.present();
         return param1;
      }
      
      public function §_-79§(param1:DisplayObject = null, param2:Vector3D = null) : Vector3D
      {
         getTransformationMatrix3D(param1,§_-S19§);
         return §_-rI§.transformCoords3D(§_-S19§,this.§_-q1a§ / 2 + this.§_-AN§.x,this.§_-D1k§ / 2 + this.§_-AN§.y,-this.§_-A2G§,param2);
      }
      
      internal function §_-O2c§(param1:DisplayObject) : void
      {
         this.§_-53W§.push(param1);
      }
      
      internal function §_-kx§(param1:DisplayObject) : void
      {
         var _loc2_:int = this.§_-53W§.indexOf(param1);
         if(_loc2_ >= 0)
         {
            this.§_-53W§.splice(_loc2_,1);
         }
      }
      
      override internal function §_-o2D§(param1:DisplayObject, param2:String, param3:Vector.<DisplayObject>) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param2 == Event.ENTER_FRAME && param1 == this)
         {
            _loc4_ = 0;
            _loc5_ = int(this.§_-53W§.length);
            while(_loc4_ < _loc5_)
            {
               param3[param3.length] = this.§_-53W§[_loc4_];
               _loc4_++;
            }
         }
         else
         {
            super.§_-o2D§(param1,param2,param3);
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
         return this.§_-Vt§;
      }
      
      public function set color(param1:uint) : void
      {
         this.§_-Vt§ = param1;
      }
      
      public function get stageWidth() : int
      {
         return this.§_-q1a§;
      }
      
      public function set stageWidth(param1:int) : void
      {
         this.§_-q1a§ = param1;
      }
      
      public function get stageHeight() : int
      {
         return this.§_-D1k§;
      }
      
      public function set stageHeight(param1:int) : void
      {
         this.§_-D1k§ = param1;
      }
      
      public function get §_-A2G§() : Number
      {
         return this.§_-q1a§ / (2 * Math.tan(this.§_-p2p§ / 2));
      }
      
      public function set §_-A2G§(param1:Number) : void
      {
         this.§_-p2p§ = 2 * Math.atan(this.stageWidth / (2 * param1));
      }
      
      public function get §_-ka§() : Number
      {
         return this.§_-p2p§;
      }
      
      public function set §_-ka§(param1:Number) : void
      {
         this.§_-p2p§ = param1;
      }
      
      public function get §_-Pt§() : Point
      {
         return this.§_-AN§;
      }
      
      public function set §_-Pt§(param1:Point) : void
      {
         this.§_-AN§.setTo(param1.x,param1.y);
      }
      
      public function get §_-tJ§() : Vector3D
      {
         return this.§_-79§(null,this.§_-wO§);
      }
   }
}

