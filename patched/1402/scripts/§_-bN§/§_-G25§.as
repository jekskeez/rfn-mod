package §_-bN§
{
   import §_-B1G§.ScrollPane;
   import §_-Mq§.DisplayObjectManager;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import utils.§_-L2J§;
   import utils.§_-d1t§;
   
   public class §_-G25§ extends Dialog
   {
      
      private static const §_-A3C§:int = 15;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","color: #000000;","font-size: 12px;","}","a {","text-decoration: underline;","margin-right: 0px;","}","a:hover {","text-decoration: none;","}"].join("\n");
      
      private static const §_-D12§:Object = {
         "Warning":new TextFormat(§_-i5§.§_-c10§,12,16744448,true),
         "Error":new TextFormat(§_-i5§.§_-c10§,12,16711680,true),
         "Sending packet with type":new TextFormat(§_-i5§.§_-c10§,12,32832,true),
         "Received server packet":new TextFormat(§_-i5§.§_-c10§,12,255,true),
         "[Request user info]":new TextFormat(§_-i5§.§_-c10§,12,3127483,true),
         "[Request user info direct]":new TextFormat(§_-i5§.§_-c10§,12,3139839,true),
         " loadPhoto:true":new TextFormat(§_-i5§.§_-c10§,12,15990790,true),
         " nocache:true":new TextFormat(§_-i5§.§_-c10§,12,15990790,true),
         "ControllerHeroLocal.ControllerHeroLocal":new TextFormat(§_-i5§.§_-c10§,12,15990790,true),
         "ControllerHeroLocal.remove":new TextFormat(§_-i5§.§_-c10§,12,15990790,true),
         "SquirrelCollection":new TextFormat(§_-i5§.§_-c10§,12,33023,true),
         "SquirrelGame":new TextFormat(§_-i5§.§_-c10§,12,33023,true),
         "GameMap":new TextFormat(§_-i5§.§_-c10§,12,33023,true),
         "GameState:":new TextFormat(§_-i5§.§_-c10§,12,33023,true),
         "ROUND_START":new TextFormat(§_-i5§.§_-c10§,12,917248,true),
         "ROUND_STARTING":new TextFormat(§_-i5§.§_-c10§,12,16772096,true),
         "ROUND_PLAYING":new TextFormat(§_-i5§.§_-c10§,12,16711929,true),
         "ROUND_WAITING":new TextFormat(§_-i5§.§_-c10§,12,16711929,true),
         "Cast":new TextFormat(§_-i5§.§_-c10§,12,33023,true),
         "new Hero:":new TextFormat(§_-i5§.§_-c10§,12,15990790,true),
         "Hero remove:":new TextFormat(§_-i5§.§_-c10§,12,15990790,true)
      };
      
      private var §_-nR§:TextField;
      
      private var §_-1m§:ScrollPane;
      
      private var §_-r1x§:Sprite;
      
      private var §_-w2a§:CheckBox;
      
      private var §_-82J§:CheckBox;
      
      private var §_-U1t§:CheckBox;
      
      private var §_-N2s§:§_-i5§ = null;
      
      public function §_-G25§()
      {
         var style:StyleSheet;
         this.§_-nR§ = new TextField();
         this.§_-1m§ = new ScrollPane();
         this.§_-r1x§ = new Sprite();
         this.§_-w2a§ = new CheckBox();
         this.§_-82J§ = new CheckBox();
         this.§_-U1t§ = new CheckBox();
         super();
         style = new StyleSheet();
         style.parseCSS(§_-aD§);
         this.§_-nR§.width = 315;
         this.§_-nR§.multiline = true;
         this.§_-nR§.wordWrap = false;
         this.§_-nR§.mouseWheelEnabled = false;
         this.§_-nR§.autoSize = TextFieldAutoSize.LEFT;
         this.§_-nR§.embedFonts = true;
         this.§_-nR§.defaultTextFormat = new TextFormat(§_-i5§.§_-c10§,12);
         this.§_-r1x§.addChild(this.§_-nR§);
         this.§_-1m§.x = §_-A3C§;
         this.§_-1m§.y = 15;
         this.§_-1m§.setSize(362,300);
         this.§_-1m§.source = this.§_-r1x§;
         addChild(this.§_-1m§);
         §_-L2J§.§_-61Q§(this.§_-w2a§);
         this.§_-w2a§.x = §_-A3C§;
         this.§_-w2a§.y = this.§_-1m§.y + 320;
         this.§_-w2a§.label = gls("Авто прокрутка");
         this.§_-w2a§.width = 300;
         addChild(this.§_-w2a§);
         §_-L2J§.§_-61Q§(this.§_-82J§);
         this.§_-82J§.x = §_-A3C§;
         this.§_-82J§.y = this.§_-w2a§.y + 20;
         this.§_-82J§.label = "Trace";
         this.§_-82J§.width = 348;
         this.§_-82J§.selected = §_-p2U§.§_-bv§;
         this.§_-82J§.addEventListener(MouseEvent.CLICK,this.§_-c22§);
         addChild(this.§_-82J§);
         addChild(new §_-i5§(gls("Порт: {0}",String(§_-Zy§.§_-m1G§)),152,this.§_-1m§.y + 322,new TextFormat(§_-i5§.§_-c10§,12,0)));
         §_-L2J§.§_-61Q§(this.§_-U1t§);
         this.§_-U1t§.x = 150;
         this.§_-U1t§.y = this.§_-w2a§.y + 20;
         this.§_-U1t§.label = "Trace Texture";
         this.§_-U1t§.width = 464;
         this.§_-U1t§.selected = §_-p2U§.§_-i10§;
         this.§_-U1t§.addEventListener(MouseEvent.CLICK,this.§_-E§);
         addChild(this.§_-U1t§);
         this.§_-N2s§ = new §_-i5§(gls("<body><a href=\'event:#\' class=\'link\'>Сохранить лог</a></body>"),287,this.§_-1m§.y + 342,style);
         this.§_-N2s§.addEventListener(MouseEvent.MOUSE_DOWN,function(param1:MouseEvent):void
         {
            param1.stopImmediatePropagation();
         });
         this.§_-N2s§.addEventListener(MouseEvent.MOUSE_UP,function(param1:MouseEvent):void
         {
            §_-p2U§.§_-m2c§();
         });
         addChild(this.§_-N2s§);
         place();
         this.width = 430;
         this.height = 400;
         this.update();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-r1i§,false,0,true);
         §_-p2U§.§_-C1x§.push(this.update);
      }
      
      override public function show() : void
      {
         §_-p2U§.add("number of texture:",DisplayObjectManager.getInstance().length);
         showDialog();
         this.update();
      }
      
      public function update(param1:String = "") : void
      {
         if(!this.visible)
         {
            return;
         }
         if(param1 == "")
         {
            this.§_-nR§.text = §_-p2U§.§_-93a§(500);
         }
         else
         {
            this.§_-nR§.appendText(param1);
         }
         this.§_-ZU§();
      }
      
      private function §_-r1i§(param1:KeyboardEvent) : void
      {
         if(!§_-p2U§.§_-t1t§)
         {
            return;
         }
         if(param1.altKey && param1.ctrlKey && param1.shiftKey && param1.keyCode == Keyboard.Z)
         {
            this.show();
         }
         if(param1.altKey && param1.ctrlKey && param1.shiftKey && param1.keyCode == Keyboard.A)
         {
         }
         if(param1.altKey && param1.ctrlKey && param1.shiftKey && param1.keyCode == Keyboard.X)
         {
            §_-p2U§.add(§_-d1t§.§_-734§());
         }
      }
      
      private function §_-ZU§() : void
      {
         this.§_-nR§.height = this.§_-nR§.textHeight + 20;
         this.§_-1m§.update();
         this.§_-52a§();
         if(this.§_-w2a§.selected)
         {
            this.§_-1m§.verticalScrollPosition = this.§_-1m§.maxVerticalScrollPosition;
         }
      }
      
      private function §_-Ze§(param1:String, param2:TextFormat) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         while(true)
         {
            _loc4_ = this.§_-nR§.text.indexOf(param1,_loc3_);
            if(_loc4_ == -1)
            {
               break;
            }
            _loc3_ = _loc4_ + param1.length;
            this.§_-nR§.setTextFormat(param2,_loc4_,_loc3_);
         }
      }
      
      private function §_-52a§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in §_-D12§)
         {
            this.§_-Ze§(_loc1_,§_-D12§[_loc1_]);
         }
      }
      
      private function §_-E§(param1:MouseEvent) : void
      {
         §_-p2U§.§_-i10§ = this.§_-U1t§.selected;
      }
      
      private function §_-c22§(param1:MouseEvent) : void
      {
         §_-p2U§.§_-bv§ = this.§_-82J§.selected;
      }
   }
}

