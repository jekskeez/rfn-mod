package §_-zG§
{
   import §_-B1G§.ScrollPane;
   import §_-U19§.§_-VK§;
   import events.§_-s1d§;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-cD§;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import utils.§_-B1d§;
   import utils.§_-S1m§;
   
   public class §_-62l§ extends Sprite
   {
      
      private static const §_-ws§:int = 25;
      
      private static const §_-B2W§:int = 3;
      
      private static const §_-aD§:String = ["body {","font-family: \"" + §_-i5§.§_-c10§ + "\";","font-size: 12px;","}","a {","color: #017ACC;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var data:Vector.<§_-VK§> = null;
      
      private var places:Vector.<§_-C1v§> = null;
      
      private var §_-X2Z§:Vector.<CheckBox> = null;
      
      private var §_-ni§:Array = [];
      
      private var §_-W1L§:CheckBox = null;
      
      private var §_-AC§:§_-i5§ = null;
      
      private var §_-QK§:§_-i5§ = null;
      
      private var §_-t2L§:§_-i5§ = null;
      
      private var §_-13o§:ScrollPane = null;
      
      private var §_-Eo§:Sprite = null;
      
      private var §_-f2j§:§_-i5§ = null;
      
      private var style:StyleSheet;
      
      public function §_-62l§()
      {
         super();
         this.init();
      }
      
      public function clear() : void
      {
         this.§_-9K§(false);
         var _loc1_:int = 0;
         while(_loc1_ < this.data.length)
         {
            this.data[_loc1_].removeEventListener("LOADED",this.§_-ZU§);
            _loc1_++;
         }
         this.data = new Vector.<§_-VK§>();
         dispatchEvent(new §_-s1d§(this.data.length));
      }
      
      public function §_-p2O§(param1:Vector.<§_-VK§>) : void
      {
         var _loc5_:int = 0;
         this.data = this.data.concat(param1);
         var _loc2_:Vector.<§_-VK§> = new Vector.<§_-VK§>();
         var _loc3_:Object = {};
         var _loc4_:* = int(this.data.length - 1);
         while(_loc4_ >= 0)
         {
            if(typeof _loc3_[this.data[_loc4_].playerId] == "undefined" || _loc3_[this.data[_loc4_].playerId] == null)
            {
               _loc2_.push(this.data[_loc4_]);
            }
            else
            {
               this.data[_loc4_].removeEventListener("LOADED",this.§_-ZU§);
            }
            _loc3_[this.data[_loc4_].playerId] = this.data[_loc4_];
            _loc4_--;
         }
         this.data = _loc2_;
         this.§_-9K§(this.data.length > 0);
         _loc4_ = 0;
         while(_loc4_ < this.data.length)
         {
            _loc5_ = this.§_-ni§.indexOf(this.data[_loc4_].playerId);
            if(_loc5_ != -1)
            {
               this.§_-ni§.splice(_loc5_,1);
            }
            this.data[_loc4_].addEventListener("LOADED",this.§_-ZU§);
            _loc4_++;
         }
         dispatchEvent(new §_-s1d§(this.data.length));
         this.§_-1S§();
         this.§_-ZU§();
      }
      
      private function §_-9K§(param1:Boolean) : void
      {
         this.§_-AC§.visible = param1;
         this.§_-QK§.visible = param1;
         this.§_-t2L§.visible = param1;
         this.§_-W1L§.visible = param1;
         this.§_-f2j§.visible = !param1;
      }
      
      public function §_-Vh§() : void
      {
         this.§_-W1L§.selected = false;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.data.length)
         {
            if(this.data[_loc2_].selected)
            {
               _loc1_.push(this.data[_loc2_].playerId);
            }
            _loc2_++;
         }
         this.data = this.data.filter(this.§_-n1u§);
         this.§_-1S§();
         this.§_-ZU§();
         this.§_-9K§(this.data.length > 0);
         dispatchEvent(new §_-s1d§(this.data.length));
         Connection.§_-e2T§(§_-u1O§.§_-k1N§,_loc1_,§_-u1O§.§_-X2O§);
      }
      
      public function §_-G1A§() : void
      {
         this.§_-W1L§.selected = false;
         var _loc1_:Array = [];
         var _loc2_:int = 0;
         while(_loc2_ < this.data.length)
         {
            if(this.data[_loc2_].selected)
            {
               _loc1_.push(this.data[_loc2_].playerId);
            }
            _loc2_++;
         }
         this.data = this.data.filter(this.§_-n1u§);
         this.§_-1S§();
         this.§_-ZU§();
         this.§_-9K§(this.data.length > 0);
         dispatchEvent(new §_-s1d§(this.data.length));
         Connection.§_-e2T§(§_-u1O§.§_-k1N§,_loc1_,§_-u1O§.§_-Td§);
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-aD§);
         this.data = new Vector.<§_-VK§>();
         this.places = new Vector.<§_-C1v§>();
         this.§_-X2Z§ = new Vector.<CheckBox>();
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(15524553);
         _loc1_.graphics.drawRoundRectComplex(0,0,325,§_-B2W§ * §_-ws§ + 40,7.5,7.5,7.5,7.5);
         _loc1_.graphics.endFill();
         _loc1_.x = -5;
         _loc1_.y = -5;
         addChild(_loc1_);
         this.§_-W1L§ = new CheckBox();
         this.§_-W1L§.x = -1;
         this.§_-W1L§.y = -3;
         this.§_-W1L§.label = "";
         this.§_-W1L§.addEventListener(Event.CHANGE,this.§_-Y2J§);
         addChild(this.§_-W1L§);
         var _loc2_:TextFormat = new TextFormat(§_-i5§.§_-c10§,11,0);
         this.§_-AC§ = new §_-i5§(gls("Имя"),23,0,_loc2_);
         addChild(this.§_-AC§);
         this.§_-QK§ = new §_-i5§(gls("Уровень"),140,0,_loc2_);
         addChild(this.§_-QK§);
         this.§_-t2L§ = new §_-i5§(gls("Дата"),236,0,_loc2_);
         addChild(this.§_-t2L§);
         var _loc3_:TextFormat = new TextFormat(§_-i5§.§_-c10§,18,6700045,true);
         this.§_-f2j§ = new §_-i5§(gls("Заявок нет"),110,40,_loc3_);
         this.§_-f2j§.visible = false;
         addChild(this.§_-f2j§);
         this.§_-13o§ = new ScrollPane();
         this.§_-13o§.setSize(314,§_-B2W§ * §_-ws§);
         this.§_-13o§.x = 0;
         this.§_-13o§.y = 30;
         addChild(this.§_-13o§);
         this.§_-Eo§ = new Sprite();
         this.§_-13o§.source = this.§_-Eo§;
      }
      
      private function §_-1S§() : void
      {
         var _loc3_:§_-C1v§ = null;
         var _loc4_:CheckBox = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.places.length)
         {
            this.places[_loc1_].§_-N2m§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-e25§);
            this.§_-X2Z§[_loc1_].removeEventListener(Event.CHANGE,this.§_-23k§);
            if(this.places[_loc1_].parent)
            {
               this.places[_loc1_].parent.removeChild(this.places[_loc1_]);
               this.§_-X2Z§[_loc1_].parent.removeChild(this.§_-X2Z§[_loc1_]);
            }
            _loc1_++;
         }
         this.places = new Vector.<§_-C1v§>();
         this.§_-X2Z§ = new Vector.<CheckBox>();
         var _loc2_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.data.length)
         {
            _loc3_ = new §_-C1v§();
            _loc3_.y = _loc2_;
            _loc3_.name = _loc1_.toString();
            _loc3_.§_-N2m§.styleSheet = this.style;
            _loc3_.§_-N2m§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-e25§);
            this.§_-Eo§.addChild(_loc3_);
            this.places.push(_loc3_);
            _loc4_ = new CheckBox();
            _loc4_.name = _loc1_.toString();
            --_loc3_.x;
            _loc4_.y = _loc3_.y - 4;
            _loc4_.label = "";
            _loc4_.addEventListener(Event.CHANGE,this.§_-23k§);
            this.§_-Eo§.addChild(_loc4_);
            this.§_-X2Z§.push(_loc4_);
            _loc2_ += §_-ws§;
            _loc1_++;
         }
         this.§_-13o§.update();
      }
      
      private function §_-ZU§(param1:Event = null) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < this.data.length)
         {
            if(this.data[_loc3_].player == null)
            {
               if(this.§_-ni§.indexOf(this.data[_loc3_].playerId) == -1)
               {
                  _loc2_.push(this.data[_loc3_].playerId);
               }
            }
            else
            {
               this.places[_loc3_].visible = true;
               this.§_-X2Z§[_loc3_].selected = this.data[_loc3_].selected;
               this.places[_loc3_].§_-kh§.text = "[" + this.data[_loc3_].level + "]";
               this.places[_loc3_].§_-t2N§.text = §_-B1d§.§_-fn§(this.data[_loc3_].time);
               §_-S1m§.§_-hB§(this.places[_loc3_].§_-N2m§,this.data[_loc3_].player,122,true,true,true);
            }
            _loc3_++;
         }
         this.§_-ni§ = this.§_-ni§.concat(_loc2_);
         if(_loc2_.length != 0)
         {
            Game.request(_loc2_,§_-Y2E§.§_-n2H§ | §_-Y2E§.§_-V2n§ | §_-Y2E§.§_-L1b§);
         }
      }
      
      private function §_-Y2J§(param1:Event) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.data.length)
         {
            this.data[_loc2_].selected = this.§_-W1L§.selected;
            _loc2_++;
         }
         this.§_-ZU§();
      }
      
      private function §_-23k§(param1:Event) : void
      {
         this.data[int(param1.currentTarget.name)].selected = Boolean(param1.currentTarget.selected);
      }
      
      private function §_-e25§(param1:MouseEvent) : void
      {
         var _loc2_:int = this.data[int(param1.target.parent.name)].playerId;
         §_-cD§.§_-e25§(_loc2_);
      }
      
      private function §_-n1u§(param1:§_-VK§, param2:int, param3:Vector.<§_-VK§>) : Boolean
      {
         if(!param3)
         {
         }
         if(param1.selected)
         {
            param2 = this.§_-ni§.indexOf(param1.playerId);
            if(param2 != -1)
            {
               this.§_-ni§.splice(param2,1);
            }
            param1.removeEventListener("LOADED",this.§_-ZU§);
         }
         return !param1.selected;
      }
   }
}

