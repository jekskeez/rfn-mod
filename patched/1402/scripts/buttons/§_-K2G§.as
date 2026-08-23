package buttons
{
   import flash.display.BitmapData;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BevelFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.DropShadowFilter;
   import flash.geom.Matrix;
   import flash.text.TextFormat;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-p1r§;
   import utils.§_-y1l§;
   
   public class §_-K2G§ extends Sprite
   {
      
      protected static const §_-B1r§:int = 80;
      
      protected static const §_-83N§:int = 40;
      
      protected static const §_-A3C§:int = 16;
      
      private static const §_-DZ§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,14,16777215);
      
      protected static const §_-zx§:Array = [null,[10,0,10,-20],[10,0,-4,-103],null];
      
      protected static const §_-m§:Array = [new DropShadowFilter(0.5,45,1342015,1,1,1),new BevelFilter(0.5,45,16777215,1,418876,1,1,1)];
      
      private static var §_-EB§:BitmapData = null;
      
      private static var §_-ej§:BitmapData = null;
      
      private static var §_-Xj§:BitmapData = null;
      
      private static var §_-22b§:ColorMatrixFilter = null;
      
      private static var §_-XX§:ColorMatrixFilter = null;
      
      private static var §_-c1c§:ColorMatrixFilter = null;
      
      private static var §_-u21§:Boolean = false;
      
      protected var _width:int = 0;
      
      protected var _enabled:Boolean = true;
      
      protected var callback:Function = null;
      
      public var button:SimpleButton = null;
      
      public var field:§_-i5§ = null;
      
      public function §_-K2G§(param1:String = "", param2:int = 0, param3:int = 14, param4:Function = null)
      {
         super();
         this._width = param2;
         init();
         this.callback = param4;
         this.button = new SimpleButton();
         this.button.addEventListener(MouseEvent.CLICK,this.click);
         addChild(this.button);
         this.field = new §_-i5§(param1,0,0,param3 == 14 ? §_-DZ§ : new TextFormat(§_-i5§.§_-p1s§,param3,16777215));
         this.field.mouseEnabled = false;
         this.field.filters = §_-m§;
         addChild(this.field);
         this.draw();
      }
      
      private static function init() : void
      {
         if(§_-u21§)
         {
            return;
         }
         §_-u21§ = true;
         if(!§_-EB§)
         {
            §_-EB§ = new BitmapData(§_-83N§,28,true,255);
            §_-EB§.draw(new ButtonBaseLeft());
         }
         if(!§_-ej§)
         {
            §_-ej§ = new BitmapData(4,28,true,255);
            §_-ej§.draw(new ButtonBaseMiddle());
         }
         if(!§_-Xj§)
         {
            §_-Xj§ = new BitmapData(§_-83N§,28,true,255);
            §_-Xj§.draw(new ButtonBaseRight());
         }
      }
      
      override public function set name(param1:String) : void
      {
         super.name = param1;
         var _loc2_:int = 0;
         while(_loc2_ < this.numChildren)
         {
            this.getChildAt(_loc2_).name = param1;
            _loc2_++;
         }
      }
      
      public function click(param1:Event = null) : void
      {
         if(this._enabled)
         {
            GameSounds.play(§_-RH§.§_-K10§,true);
            if(this.callback != null)
            {
               this.callback(param1);
            }
         }
         else
         {
            GameSounds.play("error",true);
         }
      }
      
      public function §_-lT§() : void
      {
         var _loc1_:§_-p1r§ = null;
         if(!§_-22b§)
         {
            _loc1_ = new §_-p1r§();
            _loc1_.§_-xC§(0,0,0,70);
            §_-22b§ = new ColorMatrixFilter(_loc1_);
         }
         this.button.filters = [§_-22b§];
         this.button.downState.filters = [];
      }
      
      public function §_-I29§() : void
      {
         var _loc1_:§_-p1r§ = null;
         if(!§_-XX§)
         {
            _loc1_ = new §_-p1r§();
            _loc1_.§_-xC§(-50,20,0,-110);
            §_-XX§ = new ColorMatrixFilter(_loc1_);
         }
         this.button.filters = [§_-XX§];
         this.button.downState.filters = [];
      }
      
      public function §_-y2W§() : void
      {
         var _loc1_:§_-p1r§ = null;
         if(!§_-c1c§)
         {
            _loc1_ = new §_-p1r§();
            _loc1_.§_-xC§(16,27,4,-86);
            §_-c1c§ = new ColorMatrixFilter(_loc1_);
         }
         this.button.filters = [§_-c1c§];
         this.button.downState.filters = [];
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this.callback == null)
         {
            this.mouseEnabled = this.mouseChildren = param1;
         }
         this._enabled = param1;
         this.filters = this._enabled ? [] : §_-y1l§.§_-Tk§;
      }
      
      public function redraw() : void
      {
         this.draw(true);
      }
      
      public function §_-m1J§() : void
      {
         this.field.x = int((this._width - this.field.textWidth) * 0.5) - 3;
         this.field.y = int((this.button.height - this.field.textHeight) * 0.5) - 2;
      }
      
      public function clear() : void
      {
         while(this.numChildren > 0)
         {
            removeChildAt(0);
         }
         addChild(this.button);
         addChild(this.field);
      }
      
      protected function draw(param1:Boolean = false) : void
      {
         var _loc4_:Sprite = null;
         var _loc5_:§_-p1r§ = null;
         if(this._width == 0 || param1)
         {
            this._width = §_-A3C§ * 2 + this.field.textWidth;
         }
         this._width = Math.max(§_-B1r§,this._width);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            _loc4_ = new Sprite();
            _loc4_.graphics.beginBitmapFill(§_-EB§);
            _loc4_.graphics.drawRect(0,0,§_-83N§,28);
            _loc4_.graphics.beginBitmapFill(§_-Xj§,new Matrix(1,0,0,1,this._width - §_-83N§));
            _loc4_.graphics.drawRect(this._width - §_-83N§,0,§_-83N§,28);
            if(this._width > §_-B1r§)
            {
               _loc4_.graphics.beginBitmapFill(§_-ej§,new Matrix(this._width - §_-B1r§ + 2,0,0,1));
               _loc4_.graphics.drawRect(§_-83N§ - 1,0,this._width - §_-B1r§ + 2,28);
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
         this.§_-m1J§();
      }
   }
}

