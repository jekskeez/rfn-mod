package §_-Q1P§
{
   import §_-42p§.§_-01t§;
   import §_-83V§.BalloonBody;
   import §_-83V§.GameBody;
   import §_-83V§.§_-2R§;
   import §_-83V§.§_-3p§;
   import §_-83V§.§_-918§;
   import §_-83V§.§_-L1S§;
   import §_-83V§.§_-NW§;
   import §_-83V§.§_-Y1X§;
   import §_-83V§.§_-Y28§;
   import §_-83V§.§_-h2c§;
   import §_-83V§.§_-k1b§;
   import §_-83V§.§_-q2y§;
   import §_-83V§.§_-v2C§;
   import §_-83V§.§_-x1j§;
   import §_-83V§.§_-z2r§;
   import §_-B1O§.ClickButton;
   import §_-B1O§.ScriptedTimer;
   import §_-B1O§.Sensor;
   import §_-B1O§.§_-22r§;
   import §_-B1O§.§_-A1f§;
   import §_-B1O§.§_-A37§;
   import §_-B1O§.§_-J1X§;
   import §_-B1O§.§_-M1M§;
   import §_-B1O§.§_-i2t§;
   import §_-Kr§.ScrollPane;
   import §_-Kr§.§_-53G§;
   import §_-Rn§.§_-31R§;
   import §_-Rn§.§_-43f§;
   import §_-Rn§.§_-b2J§;
   import §_-Rn§.§_-f1U§;
   import §_-Yb§.*;
   import §_-k1c§.Dialog;
   import §_-p2o§.§_-m2F§;
   import avmplus.getQualifiedClassName;
   import events.§_-63A§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   import game.mainGame.GameMap;
   import game.mainGame.entity.§_-63Q§;
   import game.mainGame.entity.§_-Q2k§;
   import game.mainGame.entity.§_-R2m§;
   
   public class §_-h3§ extends Dialog
   {
      
      private static const §_-Jw§:Array = [DisplayObject,§_-63Q§,GameBody,§_-f1U§,§_-31R§,§_-43f§,§_-b2J§,Sensor,§_-M1M§,§_-R2m§,GameMap,§_-m2F§,§_-01t§,§_-A1f§,ScriptedTimer,BalloonBody,ClickButton,§_-22r§,§_-J1X§,§_-i2t§,§_-Q2k§,§_-918§,§_-z2r§,§_-2R§,§_-Y1X§,§_-L1S§,§_-3p§,§_-q2y§,§_-A37§,§_-x1j§,§_-k1b§,§_-NW§,§_-h2c§,§_-Y28§,§_-v2C§];
      
      private static var §_-V1p§:Dictionary = null;
      
      private static var §_-81x§:Vector.<Function> = new Vector.<Function>();
      
      private var §_-M1N§:ScrollPane = new ScrollPane();
      
      private var §_-Lv§:Sprite = new Sprite();
      
      private var inspectObject:*;
      
      private var §_-xV§:§_-h10§;
      
      public function §_-h3§(param1:*)
      {
         super(gls("Свойства объекта"));
         if(§_-h3§.§_-V1p§ == null)
         {
            this.§_-c1d§();
         }
         this.§_-M1N§.setSize(375,430);
         this.§_-M1N§.source = this.§_-Lv§;
         addChild(this.§_-M1N§);
         this.§_-M1N§.update();
         this.§_-tk§(param1);
         place();
         this.width = 400;
         this.height = 480;
         show();
         Game.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§,false,0,true);
      }
      
      public static function §_-T1C§(param1:Function) : void
      {
         §_-81x§.push(param1);
      }
      
      public static function §_-r1h§(param1:Function) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < §_-81x§.length)
         {
            if(§_-81x§[_loc2_] == param1)
            {
               §_-81x§.splice(_loc2_,1);
            }
            _loc2_++;
         }
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         §_-53G§.§_-y1j§();
         while(this.§_-Lv§.numChildren > 0)
         {
            (this.§_-Lv§.getChildAt(0) as §_-h10§).removeEventListener(§_-63A§.CHANGE,this.dispatch);
            (this.§_-Lv§.getChildAt(0) as §_-h10§).dispose();
            this.§_-Lv§.removeChildAt(0);
         }
         this.§_-xV§ = null;
         Game.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-O2u§);
         super.hide(param1);
      }
      
      public function §_-tk§(param1:*) : void
      {
         var _loc2_:* = undefined;
         this.inspectObject = param1;
         for each(_loc2_ in §_-Jw§)
         {
            if(param1 is _loc2_)
            {
               if(_loc2_ in §_-V1p§)
               {
                  this.§_-u2g§(new (§_-V1p§[_loc2_] as Class)() as §_-h10§);
                  if(param1 is §_-aK§ && getQualifiedClassName(param1) == getQualifiedClassName(_loc2_))
                  {
                     break;
                  }
               }
            }
         }
         this.§_-M1N§.update();
      }
      
      private function §_-u2g§(param1:§_-h10§) : void
      {
         if(this.§_-xV§)
         {
            param1.y = this.§_-xV§.y + this.§_-xV§.§_-7e§ + 10;
         }
         param1.inspectObject = this.inspectObject;
         param1.addEventListener(§_-63A§.CHANGE,this.dispatch);
         this.§_-xV§ = param1;
         this.§_-Lv§.addChild(param1);
         this.§_-M1N§.update();
      }
      
      private function dispatch(param1:§_-63A§) : void
      {
         var _loc2_:Function = null;
         for each(_loc2_ in §_-81x§)
         {
            _loc2_(param1.className);
         }
      }
      
      private function §_-c1d§() : void
      {
         §_-h3§.§_-V1p§ = new Dictionary();
         §_-h3§.§_-V1p§[DisplayObject] = §_-c1D§;
         §_-h3§.§_-V1p§[§_-63Q§] = §_-s1x§;
         §_-h3§.§_-V1p§[GameBody] = §_-n1u§;
         §_-h3§.§_-V1p§[§_-f1U§] = §_-fP§;
         §_-h3§.§_-V1p§[§_-31R§] = §_-734§;
         §_-h3§.§_-V1p§[§_-43f§] = §_-uk§;
         §_-h3§.§_-V1p§[§_-b2J§] = §_-W1T§;
         §_-h3§.§_-V1p§[Sensor] = §_-e2F§;
         §_-h3§.§_-V1p§[§_-M1M§] = §_-EN§;
         §_-h3§.§_-V1p§[§_-R2m§] = §_-339§;
         §_-h3§.§_-V1p§[GameMap] = §_-a5§;
         §_-h3§.§_-V1p§[§_-01t§] = §_-dg§;
         §_-h3§.§_-V1p§[§_-A1f§] = §_-R2b§;
         §_-h3§.§_-V1p§[ScriptedTimer] = §_-Dg§;
         §_-h3§.§_-V1p§[BalloonBody] = §_-O17§;
         §_-h3§.§_-V1p§[ClickButton] = §_-9g§;
         §_-h3§.§_-V1p§[§_-22r§] = §_-nG§;
         §_-h3§.§_-V1p§[§_-J1X§] = §_-32Z§;
         §_-h3§.§_-V1p§[§_-i2t§] = §_-a1e§;
         §_-h3§.§_-V1p§[§_-Q2k§] = §_-82L§;
         §_-h3§.§_-V1p§[§_-m2F§] = §_-h2D§;
         §_-h3§.§_-V1p§[§_-918§] = §_-125§;
         §_-h3§.§_-V1p§[§_-z2r§] = §_-51B§;
         §_-h3§.§_-V1p§[§_-2R§] = §_-h2l§;
         §_-h3§.§_-V1p§[§_-Y1X§] = §_-U1t§;
         §_-h3§.§_-V1p§[§_-L1S§] = §_-2J§;
         §_-h3§.§_-V1p§[§_-3p§] = §_-kv§;
         §_-h3§.§_-V1p§[§_-q2y§] = §_-pF§;
         §_-h3§.§_-V1p§[§_-A37§] = §_-b1O§;
         §_-h3§.§_-V1p§[§_-x1j§] = §_-C2s§;
         §_-h3§.§_-V1p§[§_-k1b§] = §_-v24§;
         §_-h3§.§_-V1p§[§_-NW§] = §_-Ei§;
         §_-h3§.§_-V1p§[§_-h2c§] = §_-31J§;
         §_-h3§.§_-V1p§[§_-Y28§] = §_-c2V§;
         §_-h3§.§_-V1p§[§_-v2C§] = §_-12A§;
      }
      
      private function §_-O2u§(param1:KeyboardEvent) : void
      {
         if(!param1.ctrlKey || param1.keyCode != Keyboard.Q)
         {
            return;
         }
         this.hide();
      }
   }
}

