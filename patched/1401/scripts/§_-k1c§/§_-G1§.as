package §_-k1c§
{
   import §_-1T§.DisplayObjectManager;
   import §_-Kr§.ScrollPane;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.ui.Keyboard;
   import utils.§_-vS§;
   import utils.§_-vo§;
   
   public class §_-G1§ extends Dialog
   {
      
      private static const §_-V0§:int = 15;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","color: #000000;","font-size: 12px;","}","a {","text-decoration: underline;","margin-right: 0px;","}","a:hover {","text-decoration: none;","}"].join("\n");
      
      private static const §_-HM§:Object = {
         "Warning":new TextFormat(§_-22V§.§_-F2z§,12,16744448,true),
         "Error":new TextFormat(§_-22V§.§_-F2z§,12,16711680,true),
         "Sending packet with type":new TextFormat(§_-22V§.§_-F2z§,12,32832,true),
         "Received server packet":new TextFormat(§_-22V§.§_-F2z§,12,255,true),
         "[Request user info]":new TextFormat(§_-22V§.§_-F2z§,12,3127483,true),
         "[Request user info direct]":new TextFormat(§_-22V§.§_-F2z§,12,3139839,true),
         " loadPhoto:true":new TextFormat(§_-22V§.§_-F2z§,12,15990790,true),
         " nocache:true":new TextFormat(§_-22V§.§_-F2z§,12,15990790,true),
         "ControllerHeroLocal.ControllerHeroLocal":new TextFormat(§_-22V§.§_-F2z§,12,15990790,true),
         "ControllerHeroLocal.remove":new TextFormat(§_-22V§.§_-F2z§,12,15990790,true),
         "SquirrelCollection":new TextFormat(§_-22V§.§_-F2z§,12,33023,true),
         "SquirrelGame":new TextFormat(§_-22V§.§_-F2z§,12,33023,true),
         "GameMap":new TextFormat(§_-22V§.§_-F2z§,12,33023,true),
         "GameState:":new TextFormat(§_-22V§.§_-F2z§,12,33023,true),
         "ROUND_START":new TextFormat(§_-22V§.§_-F2z§,12,917248,true),
         "ROUND_STARTING":new TextFormat(§_-22V§.§_-F2z§,12,16772096,true),
         "ROUND_PLAYING":new TextFormat(§_-22V§.§_-F2z§,12,16711929,true),
         "ROUND_WAITING":new TextFormat(§_-22V§.§_-F2z§,12,16711929,true),
         "Cast":new TextFormat(§_-22V§.§_-F2z§,12,33023,true),
         "new Hero:":new TextFormat(§_-22V§.§_-F2z§,12,15990790,true),
         "Hero remove:":new TextFormat(§_-22V§.§_-F2z§,12,15990790,true)
      };
      
      private var §_-K2v§:TextField;
      
      private var §_-Sz§:ScrollPane;
      
      private var §_-12m§:Sprite;
      
      private var §_-m2L§:CheckBox;
      
      private var §_-31A§:CheckBox;
      
      private var §_-a2f§:CheckBox;
      
      private var §_-11u§:§_-22V§ = null;
      
      public function §_-G1§()
      {
         var style:StyleSheet;
         this.§_-K2v§ = new TextField();
         this.§_-Sz§ = new ScrollPane();
         this.§_-12m§ = new Sprite();
         this.§_-m2L§ = new CheckBox();
         this.§_-31A§ = new CheckBox();
         this.§_-a2f§ = new CheckBox();
         super();
         style = new StyleSheet();
         style.parseCSS(§_-I2U§);
         this.§_-K2v§.width = 315;
         this.§_-K2v§.multiline = true;
         this.§_-K2v§.wordWrap = false;
         this.§_-K2v§.mouseWheelEnabled = false;
         this.§_-K2v§.autoSize = TextFieldAutoSize.LEFT;
         this.§_-K2v§.embedFonts = true;
         this.§_-K2v§.defaultTextFormat = new TextFormat(§_-22V§.§_-F2z§,12);
         this.§_-12m§.addChild(this.§_-K2v§);
         this.§_-Sz§.x = §_-V0§;
         this.§_-Sz§.y = 15;
         this.§_-Sz§.setSize(362,300);
         this.§_-Sz§.source = this.§_-12m§;
         addChild(this.§_-Sz§);
         §_-vo§.§_-l1V§(this.§_-m2L§);
         this.§_-m2L§.x = §_-V0§;
         this.§_-m2L§.y = this.§_-Sz§.y + 320;
         this.§_-m2L§.label = gls("Авто прокрутка");
         this.§_-m2L§.width = 300;
         addChild(this.§_-m2L§);
         §_-vo§.§_-l1V§(this.§_-31A§);
         this.§_-31A§.x = §_-V0§;
         this.§_-31A§.y = this.§_-m2L§.y + 20;
         this.§_-31A§.label = "Trace";
         this.§_-31A§.width = 348;
         this.§_-31A§.selected = §_-TQ§.§_-ei§;
         this.§_-31A§.addEventListener(MouseEvent.CLICK,this.§_-m1q§);
         addChild(this.§_-31A§);
         addChild(new §_-22V§(gls("Порт: {0}",String(§_-a9§.§_-o2V§)),152,this.§_-Sz§.y + 322,new TextFormat(§_-22V§.§_-F2z§,12,0)));
         §_-vo§.§_-l1V§(this.§_-a2f§);
         this.§_-a2f§.x = 150;
         this.§_-a2f§.y = this.§_-m2L§.y + 20;
         this.§_-a2f§.label = "Trace Texture";
         this.§_-a2f§.width = 464;
         this.§_-a2f§.selected = §_-TQ§.§_-u24§;
         this.§_-a2f§.addEventListener(MouseEvent.CLICK,this.§_-NK§);
         addChild(this.§_-a2f§);
         this.§_-11u§ = new §_-22V§(gls("<body><a href=\'event:#\' class=\'link\'>Сохранить лог</a></body>"),287,this.§_-Sz§.y + 342,style);
         this.§_-11u§.addEventListener(MouseEvent.MOUSE_DOWN,function(param1:MouseEvent):void
         {
            param1.stopImmediatePropagation();
         });
         this.§_-11u§.addEventListener(MouseEvent.MOUSE_UP,function(param1:MouseEvent):void
         {
            §_-TQ§.§_-o1k§();
         });
         addChild(this.§_-11u§);
         place();
         this.width = 430;
         this.height = 400;
         this.update();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-21G§,false,0,true);
         §_-TQ§.§_-J1R§.push(this.update);
      }
      
      override public function show() : void
      {
         §_-TQ§.add("number of texture:",DisplayObjectManager.getInstance().length);
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
            this.§_-K2v§.text = §_-TQ§.§_-l5§(500);
         }
         else
         {
            this.§_-K2v§.appendText(param1);
         }
         this.§_-l13§();
      }
      
      private function §_-21G§(param1:KeyboardEvent) : void
      {
         if(!§_-TQ§.§_-L17§)
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
            §_-TQ§.add(§_-vS§.§_-5I§());
         }
      }
      
      private function §_-l13§() : void
      {
         this.§_-K2v§.height = this.§_-K2v§.textHeight + 20;
         this.§_-Sz§.update();
         this.§_-O9§();
         if(this.§_-m2L§.selected)
         {
            this.§_-Sz§.verticalScrollPosition = this.§_-Sz§.maxVerticalScrollPosition;
         }
      }
      
      private function §_-a1j§(param1:String, param2:TextFormat) : void
      {
         var _loc4_:int = 0;
         var _loc3_:int = 0;
         while(true)
         {
            _loc4_ = this.§_-K2v§.text.indexOf(param1,_loc3_);
            if(_loc4_ == -1)
            {
               break;
            }
            _loc3_ = _loc4_ + param1.length;
            this.§_-K2v§.setTextFormat(param2,_loc4_,_loc3_);
         }
      }
      
      private function §_-O9§() : void
      {
         var _loc1_:String = null;
         for(_loc1_ in §_-HM§)
         {
            this.§_-a1j§(_loc1_,§_-HM§[_loc1_]);
         }
      }
      
      private function §_-NK§(param1:MouseEvent) : void
      {
         §_-TQ§.§_-u24§ = this.§_-a2f§.selected;
      }
      
      private function §_-m1q§(param1:MouseEvent) : void
      {
         §_-TQ§.§_-ei§ = this.§_-31A§.selected;
      }
   }
}

