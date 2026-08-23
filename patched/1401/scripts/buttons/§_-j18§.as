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
   import sounds.§_-43Z§;
   import utils.§_-nO§;
   import utils.§_-x1Z§;
   
   public class §_-j18§ extends Sprite
   {
      
      protected static const §_-LB§:int = 80;
      
      protected static const §_-bT§:int = 40;
      
      protected static const §_-V0§:int = 16;
      
      private static const §_-L1e§:TextFormat = new TextFormat(§_-22V§.§_-pJ§,14,16777215);
      
      protected static const §_-d2o§:Array = [null,[10,0,10,-20],[10,0,-4,-103],null];
      
      protected static const §_-W2k§:Array = [new DropShadowFilter(0.5,45,1342015,1,1,1),new BevelFilter(0.5,45,16777215,1,418876,1,1,1)];
      
      private static var §_-H1G§:BitmapData = null;
      
      private static var §_-o1w§:BitmapData = null;
      
      private static var §_-S2s§:BitmapData = null;
      
      private static var §_-u1E§:ColorMatrixFilter = null;
      
      private static var §_-W29§:ColorMatrixFilter = null;
      
      private static var §_-nL§:ColorMatrixFilter = null;
      
      private static var §_-P20§:Boolean = false;
      
      protected var _width:int = 0;
      
      protected var _enabled:Boolean = true;
      
      protected var callback:Function = null;
      
      public var button:SimpleButton = null;
      
      public var field:§_-22V§ = null;
      
      public function §_-j18§(param1:String = "", param2:int = 0, param3:int = 14, param4:Function = null)
      {
         super();
         this._width = param2;
         init();
         this.callback = param4;
         this.button = new SimpleButton();
         this.button.addEventListener(MouseEvent.CLICK,this.click);
         addChild(this.button);
         this.field = new §_-22V§(param1,0,0,param3 == 14 ? §_-L1e§ : new TextFormat(§_-22V§.§_-pJ§,param3,16777215));
         this.field.mouseEnabled = false;
         this.field.filters = §_-W2k§;
         addChild(this.field);
         this.draw();
      }
      
      private static function init() : void
      {
         if(§_-P20§)
         {
            return;
         }
         §_-P20§ = true;
         if(!§_-H1G§)
         {
            §_-H1G§ = new BitmapData(§_-bT§,28,true,255);
            §_-H1G§.draw(new ButtonBaseLeft());
         }
         if(!§_-o1w§)
         {
            §_-o1w§ = new BitmapData(4,28,true,255);
            §_-o1w§.draw(new ButtonBaseMiddle());
         }
         if(!§_-S2s§)
         {
            §_-S2s§ = new BitmapData(§_-bT§,28,true,255);
            §_-S2s§.draw(new ButtonBaseRight());
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
            GameSounds.play(§_-43Z§.§_-o1e§,true);
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
      
      public function §_-v5§() : void
      {
         var _loc1_:§_-nO§ = null;
         if(!§_-u1E§)
         {
            _loc1_ = new §_-nO§();
            _loc1_.§_-bb§(0,0,0,70);
            §_-u1E§ = new ColorMatrixFilter(_loc1_);
         }
         this.button.filters = [§_-u1E§];
         this.button.downState.filters = [];
      }
      
      public function §_-52e§() : void
      {
         var _loc1_:§_-nO§ = null;
         if(!§_-W29§)
         {
            _loc1_ = new §_-nO§();
            _loc1_.§_-bb§(-50,20,0,-110);
            §_-W29§ = new ColorMatrixFilter(_loc1_);
         }
         this.button.filters = [§_-W29§];
         this.button.downState.filters = [];
      }
      
      public function §_-81E§() : void
      {
         var _loc1_:§_-nO§ = null;
         if(!§_-nL§)
         {
            _loc1_ = new §_-nO§();
            _loc1_.§_-bb§(16,27,4,-86);
            §_-nL§ = new ColorMatrixFilter(_loc1_);
         }
         this.button.filters = [§_-nL§];
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
         this.filters = this._enabled ? [] : §_-x1Z§.§_-c2G§;
      }
      
      public function redraw() : void
      {
         this.draw(true);
      }
      
      public function §_-g2P§() : void
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
         var _loc5_:§_-nO§ = null;
         if(this._width == 0 || param1)
         {
            this._width = §_-V0§ * 2 + this.field.textWidth;
         }
         this._width = Math.max(§_-LB§,this._width);
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < 4)
         {
            _loc4_ = new Sprite();
            _loc4_.graphics.beginBitmapFill(§_-H1G§);
            _loc4_.graphics.drawRect(0,0,§_-bT§,28);
            _loc4_.graphics.beginBitmapFill(§_-S2s§,new Matrix(1,0,0,1,this._width - §_-bT§));
            _loc4_.graphics.drawRect(this._width - §_-bT§,0,§_-bT§,28);
            if(this._width > §_-LB§)
            {
               _loc4_.graphics.beginBitmapFill(§_-o1w§,new Matrix(this._width - §_-LB§ + 2,0,0,1));
               _loc4_.graphics.drawRect(§_-bT§ - 1,0,this._width - §_-LB§ + 2,28);
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
         this.§_-g2P§();
      }
   }
}

