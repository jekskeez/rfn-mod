package buttons
{
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Matrix;
   import utils.§_-nO§;
   
   public class §_-hH§ extends §_-j18§
   {
      
      private static const §_-V2§:Number = 2;
      
      private static var §_-H1G§:BitmapData = null;
      
      private static var §_-o1w§:BitmapData = null;
      
      private static var §_-S2s§:BitmapData = null;
      
      private static var §_-P20§:Boolean = false;
      
      private var scale:Number = 1;
      
      public function §_-hH§(param1:String = "", param2:int = 0, param3:int = 14, param4:Function = null, param5:Number = 1)
      {
         init();
         this.scale = param5;
         super(param1,param2,param3,param4);
      }
      
      private static function init() : void
      {
         if(§_-P20§)
         {
            return;
         }
         §_-P20§ = true;
         var _loc1_:Matrix = new Matrix(§_-V2§,0,0,§_-V2§);
         if(!§_-H1G§)
         {
            §_-H1G§ = new BitmapData(§_-bT§ * §_-V2§,28 * §_-V2§,true,255);
            §_-H1G§.draw(new ButtonBaseLeft(),_loc1_);
         }
         if(!§_-o1w§)
         {
            §_-o1w§ = new BitmapData(4 * §_-V2§,28 * §_-V2§,true,255);
            §_-o1w§.draw(new ButtonBaseMiddle(),_loc1_);
         }
         if(!§_-S2s§)
         {
            §_-S2s§ = new BitmapData(§_-bT§ * §_-V2§,28 * §_-V2§,true,255);
            §_-S2s§.draw(new ButtonBaseRight(),_loc1_);
         }
      }
      
      override protected function draw(param1:Boolean = false) : void
      {
         var _loc4_:Sprite = null;
         var _loc5_:§_-nO§ = null;
         if(this._width == 0 || param1)
         {
            this._width = §_-V0§ * 2 + this.field.textWidth;
         }
         this._width = Math.max(§_-LB§ * this.scale,this._width);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            _loc4_ = new Sprite();
            _loc4_.graphics.beginBitmapFill(§_-H1G§,new Matrix(this.scale / §_-V2§,0,0,this.scale / §_-V2§));
            _loc4_.graphics.drawRect(0,0,§_-bT§ * this.scale,28 * this.scale);
            _loc4_.graphics.beginBitmapFill(§_-S2s§,new Matrix(this.scale / §_-V2§,0,0,this.scale / §_-V2§,this._width - §_-bT§ * this.scale));
            _loc4_.graphics.drawRect(this._width - §_-bT§ * this.scale,0,§_-bT§ * this.scale,28 * this.scale);
            if(this._width > §_-LB§ * this.scale)
            {
               _loc4_.graphics.beginBitmapFill(§_-o1w§,new Matrix((this._width - §_-LB§ * this.scale + 2) / §_-V2§,0,0,this.scale / §_-V2§));
               _loc4_.graphics.drawRect(§_-bT§ * this.scale - 1,0,this._width - §_-LB§ * this.scale + 2,28 * this.scale);
            }
            if(§_-d2o§[_loc3_] != null)
            {
               _loc5_ = new §_-nO§();
               _loc5_.§_-bb§(§_-d2o§[_loc3_][0],§_-d2o§[_loc3_][1],§_-d2o§[_loc3_][2],§_-d2o§[_loc3_][3]);
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

