package §_-T2y§
{
   import §_-I10§.§_-13r§;
   import §_-I10§.§_-Q2v§;
   import §_-k1c§.Dialog;
   import buttons.§_-91k§;
   import buttons.§_-F1F§;
   import buttons.§_-G2L§;
   import buttons.§_-LD§;
   import buttons.§_-T2z§;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   import ratings.§_-633§;
   import ratings.§_-63f§;
   import ratings.§_-t2m§;
   import sounds.GameSounds;
   import sounds.§_-43Z§;
   import utils.§_-x1Z§;
   
   public class §_-J2n§ extends Screen
   {
      
      public static const §_-Z26§:int = 3;
      
      private static var _instance:§_-J2n§;
      
      public static const §_-HM§:Array = [new TextFormat(§_-22V§.§_-pJ§,16,8746579),new TextFormat(§_-22V§.§_-pJ§,16,8746579),new TextFormat(§_-22V§.§_-pJ§,16,8746579)];
      
      public static var selected:int = -1;
      
      private var §_-P20§:Boolean = false;
      
      private var §_-j1A§:§_-G2L§ = null;
      
      private var §_-Z1O§:Array = [];
      
      private var §_-KL§:Sprite = null;
      
      private var §_-rm§:Sprite = null;
      
      public function §_-J2n§()
      {
         _instance = this;
         super();
      }
      
      public static function get instance() : §_-J2n§
      {
         return _instance;
      }
      
      override public function show() : void
      {
         super.show();
         if(!this.§_-P20§)
         {
            this.init();
            this.§_-P20§ = true;
         }
         this.§_-j1A§.visible = true;
         if(selected != -1)
         {
            this.§_-j1A§.§_-32c§(this.§_-Z1O§[selected]);
            selected = -1;
         }
         §_-Q2v§.§_-S2y§(§_-Q2v§.§_-aS§);
      }
      
      override public function hide() : void
      {
         super.hide();
         this.§_-j1A§.visible = false;
      }
      
      private function init() : void
      {
         var field:§_-22V§;
         var buttonExit:SimpleButton;
         var screenshotButton:§_-LD§;
         var buttonArray:Array;
         var viewsArray:Array;
         var i:int;
         var button:§_-F1F§ = null;
         this.§_-KL§ = new Sprite();
         addChild(this.§_-KL§);
         this.§_-rm§ = new Sprite();
         addChild(this.§_-rm§);
         this.§_-rm§.addChild(new ScreenRatingBackground());
         field = new §_-22V§(gls("Рейтинги"),0,5,new TextFormat(§_-22V§.§_-pJ§,21,16763904));
         field.x = int((§_-a9§.§_-9o§ - field.textWidth) * 0.5);
         field.filters = Dialog.§_-m2A§;
         this.§_-rm§.addChild(field);
         buttonExit = new §_-91k§();
         buttonExit.x = 870;
         buttonExit.y = 10;
         buttonExit.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
         {
            GameSounds.play(§_-43Z§.§_-o1e§);
            §_-71o§.show(§_-71o§.§_-n2M§);
         });
         this.§_-rm§.addChild(buttonExit);
         screenshotButton = new §_-LD§(true);
         screenshotButton.x = 830;
         screenshotButton.y = 10;
         this.§_-rm§.addChild(screenshotButton);
         this.§_-j1A§ = new §_-G2L§();
         this.§_-j1A§.x = 33;
         buttonArray = [new §_-T2z§(gls("Моя лига"),§_-HM§,ButtonRatingSquirrelLeague,12,13),new §_-T2z§(gls("Лучшие\nигроки"),§_-HM§,ButtonRatingSquirreTop,3,18),new §_-T2z§(gls("Друзья"),§_-HM§,ButtonRatingSquirrelFriends,12,12),new §_-T2z§(gls("Мой клан"),§_-HM§,ButtonRatingClanLeague,12,16),new §_-T2z§(gls("Лучшие\nкланы"),§_-HM§,ButtonRatingClanTop,3,29)];
         viewsArray = [new §_-t2m§(§_-13r§.PLAYER_TYPE),new §_-633§(§_-13r§.PLAYER_TYPE),new §_-63f§(§_-13r§.PLAYER_TYPE),new §_-t2m§(§_-13r§.CLAN_TYPE),new §_-633§(§_-13r§.CLAN_TYPE)];
         buttonArray.push(new ButtonRatingSomething());
         viewsArray.push(new Sprite());
         i = 0;
         while(i < buttonArray.length)
         {
            viewsArray[i].y = 85;
            this.§_-rm§.addChild(viewsArray[i]);
            button = new §_-F1F§(buttonArray[i]);
            button.x = 154 * i;
            if(i == 6)
            {
               button.x -= 90;
            }
            button.y = 35;
            if(i > 4)
            {
               button.filters = §_-x1Z§.§_-c2G§;
               button.block = true;
            }
            this.§_-j1A§.insert(button,viewsArray[i]);
            this.§_-Z1O§.push(button);
            i++;
         }
         this.§_-rm§.addChild(this.§_-j1A§);
         §_-K1r§.addEventListener(§_-K1r§.§_-n2V§,this.§_-5W§);
         this.§_-5W§();
      }
      
      private function §_-5W§(param1:Event = null) : void
      {
         var _loc2_:Number = Game.starling.stage.stageWidth;
         var _loc3_:Number = Game.starling.stage.stageHeight;
         this.§_-KL§.graphics.clear();
         this.§_-KL§.graphics.beginFill(16183517);
         this.§_-KL§.graphics.drawRect(0,0,_loc2_,_loc3_);
         this.§_-KL§.graphics.endFill();
         this.§_-rm§.x = (_loc2_ - §_-a9§.§_-9o§) * 0.5;
         this.§_-rm§.y = (_loc3_ - §_-a9§.§_-31m§) * 0.5;
      }
   }
}

