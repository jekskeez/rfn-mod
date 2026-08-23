package §_-e1G§
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   
   public class §_-Hb§ extends Sprite
   {
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","color: #000000;","}",".small {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 10px;","color: #FF0000;","}",".green {","color: #1B5B08;","font-weight: bold;","}",".red {","color: #CC0000;","font-weight: bold;","}",".center {","text-align: center;","}",".leftstr, .rightstr {","float: left;","width: 50%;","}",".rightstr {","text-align: right;","}"].join("\n");
      
      public var field:§_-22V§ = null;
      
      public var maxWidth:int = 185;
      
      protected var isHtml:Boolean = false;
      
      protected var §_-u1B§:DisplayObject = null;
      
      private var bold:Boolean = false;
      
      private var §_-cx§:Boolean = false;
      
      private var §_-02s§:Boolean = false;
      
      public function §_-Hb§(param1:DisplayObject, param2:String = "", param3:Boolean = false, param4:Boolean = false, param5:Boolean = false)
      {
         super();
         this.§_-u1B§ = param1;
         this.visible = false;
         this.bold = param3;
         this.isHtml = param4;
         this.§_-cx§ = param5;
         this.init(param2);
         if(this.§_-u1B§ is Sprite)
         {
            (this.§_-u1B§ as Sprite).buttonMode = true;
         }
      }
      
      public function add() : void
      {
         if(this.§_-02s§)
         {
            return;
         }
         this.§_-02s§ = true;
         if(this.§_-cx§)
         {
            this.§_-u1B§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-027§,false,0,true);
            this.§_-u1B§.addEventListener(MouseEvent.MOUSE_UP,this.§_-027§,false,0,true);
            this.§_-u1B§.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§,false,0,true);
            this.§_-u1B§.addEventListener(MouseEvent.MOUSE_OUT,this.close,false,0,true);
            this.§_-u1B§.addEventListener(Event.REMOVED,this.§_-q1v§,false,0,true);
            this.§_-u1B§.addEventListener(Event.REMOVED_FROM_STAGE,this.§_-q1v§,false,0,true);
         }
         else
         {
            this.§_-u1B§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-027§);
            this.§_-u1B§.addEventListener(MouseEvent.MOUSE_UP,this.§_-027§);
            this.§_-u1B§.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§);
            this.§_-u1B§.addEventListener(MouseEvent.MOUSE_OUT,this.close);
            this.§_-u1B§.addEventListener(Event.REMOVED,this.§_-q1v§);
            this.§_-u1B§.addEventListener(Event.REMOVED_FROM_STAGE,this.§_-q1v§);
         }
      }
      
      public function hide() : void
      {
         this.close();
      }
      
      public function remove() : void
      {
         this.§_-u1B§.removeEventListener(MouseEvent.MOUSE_OVER,this.§_-027§);
         this.§_-u1B§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-027§);
         this.§_-u1B§.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-D23§);
         this.§_-u1B§.removeEventListener(MouseEvent.MOUSE_OUT,this.close);
         this.§_-u1B§.removeEventListener(Event.REMOVED,this.§_-q1v§);
         this.§_-u1B§.removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-q1v§);
         this.§_-02s§ = false;
         this.close();
      }
      
      public function setStatus(param1:String) : void
      {
         if(this.field.text == param1)
         {
            return;
         }
         this.field.text = param1;
         this.field.width = this.maxWidth;
         this.field.width = this.field.textWidth + 6;
         this.draw();
      }
      
      public function setStyle(param1:StyleSheet) : void
      {
         this.field.styleSheet = param1;
         this.field.htmlText = this.field.text;
         this.§_-r2m§(-12);
      }
      
      public function §_-r2m§(param1:int) : void
      {
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,this.width + 10,this.height + 4 + param1,5,5,5,5);
         this.graphics.endFill();
      }
      
      protected function §_-027§(param1:MouseEvent) : void
      {
         if(!this.§_-r19§())
         {
            this.close();
            return;
         }
         var _loc2_:Point = Game.§_-d2t§.globalToLocal(new Point(param1.stageX,param1.stageY));
         this.x = _loc2_.x + 13;
         this.y = _loc2_.y + 10;
         if(this.x + this.width > Game.stage.stageWidth)
         {
            this.x = _loc2_.x - this.width;
         }
         if(this.y + this.height > Game.stage.stageHeight)
         {
            this.y = _loc2_.y - this.height;
         }
         if(param1.type == MouseEvent.MOUSE_UP && Game.§_-d2t§.contains(this))
         {
            Game.§_-d2t§.removeChild(this);
         }
         if(Game.§_-d2t§.contains(this))
         {
            return;
         }
         Game.§_-d2t§.addChild(this);
         this.visible = true;
      }
      
      protected function §_-D23§(param1:MouseEvent) : void
      {
         if(!this.§_-r19§())
         {
            this.close();
            return;
         }
         var _loc2_:Point = Game.§_-d2t§.globalToLocal(new Point(param1.stageX,param1.stageY));
         this.x = _loc2_.x + 13;
         this.y = _loc2_.y + 10;
         if(this.x + this.width > Game.stage.stageWidth)
         {
            this.x = _loc2_.x - this.width;
         }
         if(this.y + this.height > Game.stage.stageHeight)
         {
            this.y = _loc2_.y - this.height;
         }
      }
      
      protected function close(param1:MouseEvent = null) : void
      {
         this.visible = false;
         if(Game.§_-d2t§ == null || !Game.§_-d2t§.contains(this))
         {
            return;
         }
         Game.§_-d2t§.removeChild(this);
      }
      
      protected function update() : void
      {
         this.draw();
      }
      
      protected function draw() : void
      {
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,this.width + 10,this.height + 4,5,5,5,5);
         this.graphics.endFill();
      }
      
      protected function get baseFormat() : TextFormat
      {
         return new TextFormat(null,12,0,this.bold);
      }
      
      private function init(param1:String) : void
      {
         var _loc2_:StyleSheet = null;
         if(this.isHtml)
         {
            _loc2_ = new StyleSheet();
            _loc2_.parseCSS(§_-I2U§);
         }
         this.field = new §_-22V§("",5,2,this.isHtml ? _loc2_ : this.baseFormat);
         this.field.wordWrap = true;
         addChild(this.field);
         this.add();
         this.setStatus(param1);
      }
      
      private function §_-r19§() : Boolean
      {
         if(!this.§_-u1B§ || !this.§_-u1B§.stage)
         {
            return false;
         }
         var _loc1_:DisplayObject = this.§_-u1B§;
         while(_loc1_)
         {
            if(!_loc1_.visible)
            {
               return false;
            }
            _loc1_ = _loc1_.parent;
         }
         return true;
      }
      
      private function §_-q1v§(param1:Event) : void
      {
         this.close();
      }
   }
}

