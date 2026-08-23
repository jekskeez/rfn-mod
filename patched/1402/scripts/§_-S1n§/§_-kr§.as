package §_-S1n§
{
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   
   public class §_-kr§ extends Sprite
   {
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","color: #000000;","}",".small {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 10px;","color: #FF0000;","}",".green {","color: #1B5B08;","font-weight: bold;","}",".red {","color: #CC0000;","font-weight: bold;","}",".center {","text-align: center;","}",".leftstr, .rightstr {","float: left;","width: 50%;","}",".rightstr {","text-align: right;","}"].join("\n");
      
      public var field:§_-i5§ = null;
      
      public var maxWidth:int = 185;
      
      protected var isHtml:Boolean = false;
      
      protected var §_-P1X§:DisplayObject = null;
      
      private var bold:Boolean = false;
      
      private var §_-c2i§:Boolean = false;
      
      private var §_-Ry§:Boolean = false;
      
      public function §_-kr§(param1:DisplayObject, param2:String = "", param3:Boolean = false, param4:Boolean = false, param5:Boolean = false)
      {
         super();
         this.§_-P1X§ = param1;
         this.visible = false;
         this.bold = param3;
         this.isHtml = param4;
         this.§_-c2i§ = param5;
         this.init(param2);
         if(this.§_-P1X§ is Sprite)
         {
            (this.§_-P1X§ as Sprite).buttonMode = true;
         }
      }
      
      public function add() : void
      {
         if(this.§_-Ry§)
         {
            return;
         }
         this.§_-Ry§ = true;
         if(this.§_-c2i§)
         {
            this.§_-P1X§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-O1s§,false,0,true);
            this.§_-P1X§.addEventListener(MouseEvent.MOUSE_UP,this.§_-O1s§,false,0,true);
            this.§_-P1X§.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§,false,0,true);
            this.§_-P1X§.addEventListener(MouseEvent.MOUSE_OUT,this.close,false,0,true);
            this.§_-P1X§.addEventListener(Event.REMOVED,this.§_-jF§,false,0,true);
            this.§_-P1X§.addEventListener(Event.REMOVED_FROM_STAGE,this.§_-jF§,false,0,true);
         }
         else
         {
            this.§_-P1X§.addEventListener(MouseEvent.MOUSE_OVER,this.§_-O1s§);
            this.§_-P1X§.addEventListener(MouseEvent.MOUSE_UP,this.§_-O1s§);
            this.§_-P1X§.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§);
            this.§_-P1X§.addEventListener(MouseEvent.MOUSE_OUT,this.close);
            this.§_-P1X§.addEventListener(Event.REMOVED,this.§_-jF§);
            this.§_-P1X§.addEventListener(Event.REMOVED_FROM_STAGE,this.§_-jF§);
         }
      }
      
      public function hide() : void
      {
         this.close();
      }
      
      public function remove() : void
      {
         this.§_-P1X§.removeEventListener(MouseEvent.MOUSE_OVER,this.§_-O1s§);
         this.§_-P1X§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-O1s§);
         this.§_-P1X§.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-Cv§);
         this.§_-P1X§.removeEventListener(MouseEvent.MOUSE_OUT,this.close);
         this.§_-P1X§.removeEventListener(Event.REMOVED,this.§_-jF§);
         this.§_-P1X§.removeEventListener(Event.REMOVED_FROM_STAGE,this.§_-jF§);
         this.§_-Ry§ = false;
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
         this.§_-L25§(-12);
      }
      
      public function §_-L25§(param1:int) : void
      {
         this.graphics.clear();
         this.graphics.beginFill(16777215,0.9);
         this.graphics.drawRoundRectComplex(0,0,this.width + 10,this.height + 4 + param1,5,5,5,5);
         this.graphics.endFill();
      }
      
      protected function §_-O1s§(param1:MouseEvent) : void
      {
         if(!this.§_-F24§())
         {
            this.close();
            return;
         }
         var _loc2_:Point = Game.§_-q1L§.globalToLocal(new Point(param1.stageX,param1.stageY));
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
         if(param1.type == MouseEvent.MOUSE_UP && Game.§_-q1L§.contains(this))
         {
            Game.§_-q1L§.removeChild(this);
         }
         if(Game.§_-q1L§.contains(this))
         {
            return;
         }
         Game.§_-q1L§.addChild(this);
         this.visible = true;
      }
      
      protected function §_-Cv§(param1:MouseEvent) : void
      {
         if(!this.§_-F24§())
         {
            this.close();
            return;
         }
         var _loc2_:Point = Game.§_-q1L§.globalToLocal(new Point(param1.stageX,param1.stageY));
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
         if(Game.§_-q1L§ == null || !Game.§_-q1L§.contains(this))
         {
            return;
         }
         Game.§_-q1L§.removeChild(this);
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
            _loc2_.parseCSS(§_-aD§);
         }
         this.field = new §_-i5§("",5,2,this.isHtml ? _loc2_ : this.baseFormat);
         this.field.wordWrap = true;
         addChild(this.field);
         this.add();
         this.setStatus(param1);
      }
      
      private function §_-F24§() : Boolean
      {
         if(!this.§_-P1X§ || !this.§_-P1X§.stage)
         {
            return false;
         }
         var _loc1_:DisplayObject = this.§_-P1X§;
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
      
      private function §_-jF§(param1:Event) : void
      {
         this.close();
      }
   }
}

