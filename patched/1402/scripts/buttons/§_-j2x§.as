package buttons
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Matrix;
   import utils.§_-p1r§;
   
   public class §_-j2x§ extends §_-K2G§
   {
      
      private static const §_-71T§:Number = 2;
      
      private static var §_-EB§:BitmapData = null;
      
      private static var §_-ej§:BitmapData = null;
      
      private static var §_-Xj§:BitmapData = null;
      
      private static var §_-u21§:Boolean = false;
      
      private var scale:Number = 1;
      
      public function §_-j2x§(param1:String = "", param2:int = 0, param3:int = 14, param4:Function = null, param5:Number = 1)
      {
         init();
         this.scale = param5;
         super(param1,param2,param3,param4);
      }
      
      private static function init() : void
      {
         if(§_-u21§)
         {
            return;
         }
         §_-u21§ = true;
         var _loc1_:Matrix = new Matrix(§_-71T§,0,0,§_-71T§);
         if(!§_-EB§)
         {
            §_-EB§ = new BitmapData(§_-83N§ * §_-71T§,28 * §_-71T§,true,255);
            §_-EB§.draw(new ButtonBaseLeft(),_loc1_);
         }
         if(!§_-ej§)
         {
            §_-ej§ = new BitmapData(4 * §_-71T§,28 * §_-71T§,true,255);
            §_-ej§.draw(new ButtonBaseMiddle(),_loc1_);
         }
         if(!§_-Xj§)
         {
            §_-Xj§ = new BitmapData(§_-83N§ * §_-71T§,28 * §_-71T§,true,255);
            §_-Xj§.draw(new ButtonBaseRight(),_loc1_);
         }
      }
      
      override protected function draw(param1:Boolean = false) : void
      {
         var _loc4_:Sprite = null;
         var _loc5_:§_-p1r§ = null;
         if(this._width == 0 || param1)
         {
            this._width = §_-A3C§ * 2 + this.field.textWidth;
         }
         this._width = Math.max(§_-B1r§ * this.scale,this._width);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            _loc4_ = new Sprite();
            _loc4_.graphics.beginBitmapFill(§_-EB§,new Matrix(this.scale / §_-71T§,0,0,this.scale / §_-71T§));
            _loc4_.graphics.drawRect(0,0,§_-83N§ * this.scale,28 * this.scale);
            _loc4_.graphics.beginBitmapFill(§_-Xj§,new Matrix(this.scale / §_-71T§,0,0,this.scale / §_-71T§,this._width - §_-83N§ * this.scale));
            _loc4_.graphics.drawRect(this._width - §_-83N§ * this.scale,0,§_-83N§ * this.scale,28 * this.scale);
            if(this._width > §_-B1r§ * this.scale)
            {
               _loc4_.graphics.beginBitmapFill(§_-ej§,new Matrix((this._width - §_-B1r§ * this.scale + 2) / §_-71T§,0,0,this.scale / §_-71T§));
               _loc4_.graphics.drawRect(§_-83N§ * this.scale - 1,0,this._width - §_-B1r§ * this.scale + 2,28 * this.scale);
            }
            if(§_-zx§[_loc3_] != null)
            {
               _loc5_ = new §_-p1r§();
               _loc5_.§_-xC§(§_-zx§[_loc3_][0],§_-zx§[_loc3_][1],§_-zx§[_loc3_][2],§_-zx§[_loc3_][3]);
               _loc4_.filters = [new ColorMatrixFilter(_loc5_)];
            }
            _loc2_.push(_loc4_);
            _loc3_++;
         }
         this.button.upState = _loc2_[0];
         this.button.overState = _loc2_[1];
         this.button.downState = _loc2_[2];
         this.button.hitTestState = _loc2_[3];
         this.field.x = int((this._width - this.field.textWidth) * 0.5) - 3;
         this.field.y = int((this.button.height - this.field.textHeight) * 0.5) - 2;
      }
   }
}

