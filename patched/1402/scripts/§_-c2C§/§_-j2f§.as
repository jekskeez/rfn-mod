package §_-c2C§
{
   import §_-X1k§.§_-82O§;
   import §_-X1k§.§_-Ac§;
   import §_-bN§.Dialog;
   import buttons.§_-917§;
   import buttons.§_-Hg§;
   import buttons.§_-Q1W§;
   import buttons.§_-Z2B§;
   import buttons.§_-uH§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import ratings.§_-C9§;
   import ratings.§_-n7§;
   import ratings.§_-qg§;
   import sounds.GameSounds;
   import sounds.§_-RH§;
   import utils.§_-y1l§;
   
   public class §_-j2f§ extends Screen
   {
      
      public static const §_-u17§:int = 3;
      
      private static var _instance:§_-j2f§;
      
      public static const §_-D12§:Array = [new TextFormat(§_-i5§.§_-p1s§,16,8746579),new TextFormat(§_-i5§.§_-p1s§,16,8746579),new TextFormat(§_-i5§.§_-p1s§,16,8746579)];
      
      public static var selected:int = -1;
      
      private var §_-u21§:Boolean = false;
      
      private var §_-G6§:§_-Hg§ = null;
      
      private var §_-H2a§:Array = [];
      
      private var §_-t2p§:Sprite = null;
      
      private var §_-03N§:Sprite = null;
      
      public function §_-j2f§()
      {
         _instance = this;
         super();
      }
      
      public static function get instance() : §_-j2f§
      {
         return _instance;
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-u21§)
         {
            this.init();
            this.§_-u21§ = true;
         }
         this.§_-G6§.visible = true;
         if(selected != -1)
         {
            this.§_-G6§.§_-l1Y§(this.§_-H2a§[selected]);
            selected = -1;
         }
         §_-Ac§.§_-91§(§_-Ac§.§_-qV§);
      }
      
      override public function hide() : void
      {
         super.hide();
         this.§_-G6§.visible = false;
      }
      
      private function init() : void
      {
         var field:§_-i5§;
         var buttonExit:SimpleButton;
         var screenshotButton:§_-Z2B§;
         var buttonArray:Array;
         var viewsArray:Array;
         var i:int;
         var button:§_-uH§ = null;
         this.§_-t2p§ = new Sprite();
         addChild(this.§_-t2p§);
         this.§_-03N§ = new Sprite();
         addChild(this.§_-03N§);
         this.§_-03N§.addChild(new ScreenRatingBackground());
         field = new §_-i5§(gls("Рейтинги"),0,5,new TextFormat(§_-i5§.§_-p1s§,21,16763904));
         field.x = int((§_-Zy§.§_-21V§ - field.textWidth) * 0.5);
         field.filters = Dialog.§_-q2I§;
         this.§_-03N§.addChild(field);
         buttonExit = new §_-917§();
         buttonExit.x = 870;
         buttonExit.y = 10;
         buttonExit.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            GameSounds.play(§_-RH§.§_-K10§);
            §_-t2c§.show(§_-t2c§.§_-di§);
         });
         this.§_-03N§.addChild(buttonExit);
         screenshotButton = new §_-Z2B§(true);
         screenshotButton.x = 830;
         screenshotButton.y = 10;
         this.§_-03N§.addChild(screenshotButton);
         this.§_-G6§ = new §_-Hg§();
         this.§_-G6§.x = 33;
         buttonArray = [new §_-Q1W§(gls("Моя лига"),§_-D12§,ButtonRatingSquirrelLeague,12,13),new §_-Q1W§(gls("Лучшие\nигроки"),§_-D12§,ButtonRatingSquirreTop,3,18),new §_-Q1W§(gls("Друзья"),§_-D12§,ButtonRatingSquirrelFriends,12,12),new §_-Q1W§(gls("Мой клан"),§_-D12§,ButtonRatingClanLeague,12,16),new §_-Q1W§(gls("Лучшие\nкланы"),§_-D12§,ButtonRatingClanTop,3,29)];
         viewsArray = [new §_-qg§(§_-82O§.PLAYER_TYPE),new §_-n7§(§_-82O§.PLAYER_TYPE),new §_-C9§(§_-82O§.PLAYER_TYPE),new §_-qg§(§_-82O§.CLAN_TYPE),new §_-n7§(§_-82O§.CLAN_TYPE)];
         buttonArray.push(new ButtonRatingSomething());
         viewsArray.push(new Sprite());
         i = 0;
         while(i < buttonArray.length)
         {
            viewsArray[i].y = 85;
            this.§_-03N§.addChild(viewsArray[i]);
            button = new §_-uH§(buttonArray[i]);
            button.x = 154 * i;
            if(i == 6)
            {
               button.x -= 90;
            }
            button.y = 35;
            if(i > 4)
            {
               button.filters = §_-y1l§.§_-Tk§;
               button.block = true;
            }
            this.§_-G6§.insert(button,viewsArray[i]);
            this.§_-H2a§.push(button);
            i++;
         }
         this.§_-03N§.addChild(this.§_-G6§);
         §_-73Q§.addEventListener(§_-73Q§.§_-J1D§,this.§_-w2y§);
         this.§_-w2y§();
      }
      
      private function §_-w2y§(param1:Event = null) : void
      {
         var _loc2_:Number = Game.starling.stage.stageWidth;
         var _loc3_:Number = Game.starling.stage.stageHeight;
         this.§_-t2p§.graphics.clear();
         this.§_-t2p§.graphics.beginFill(16183517);
         this.§_-t2p§.graphics.drawRect(0,0,_loc2_,_loc3_);
         this.§_-t2p§.graphics.endFill();
         this.§_-03N§.x = (_loc2_ - §_-Zy§.§_-21V§) * 0.5;
         this.§_-03N§.y = (_loc3_ - §_-Zy§.§_-02T§) * 0.5;
      }
   }
}

