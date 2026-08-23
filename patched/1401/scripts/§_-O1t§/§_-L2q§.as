package §_-O1t§
{
   import §_-Kr§.ScrollPane;
   import §_-dc§.§_-Rm§;
   import events.§_-T25§;
   import fl.controls.CheckBox;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.StyleSheet;
   import flash.text.TextFormat;
   import menu.§_-927§;
   import protocol.Connection;
   import protocol.§_-h2B§;
   import utils.§_-Y1S§;
   import utils.§_-ex§;
   
   public class §_-L2q§ extends Sprite
   {
      
      private static const §_-p1h§:int = 25;
      
      private static const §_-42X§:int = 3;
      
      private static const §_-I2U§:String = ["body {","font-family: \"" + §_-22V§.§_-F2z§ + "\";","font-size: 12px;","}","a {","color: #017ACC;","text-decoration: none;","margin-right: 0px;","font-weight: bold;","}","a:hover {","text-decoration: underline;","}"].join("\n");
      
      private var data:Vector.<§_-Rm§> = null;
      
      private var places:Vector.<§_-n1p§> = null;
      
      private var §_-c1V§:Vector.<CheckBox> = null;
      
      private var §_-N2w§:Array = [];
      
      private var §_-WG§:CheckBox = null;
      
      private var §_-T21§:§_-22V§ = null;
      
      private var §_-cI§:§_-22V§ = null;
      
      private var §_-32W§:§_-22V§ = null;
      
      private var §_-n2i§:ScrollPane = null;
      
      private var §_-93G§:Sprite = null;
      
      private var §_-IM§:§_-22V§ = null;
      
      private var style:StyleSheet;
      
      public function §_-L2q§()
      {
         super();
         this.init();
      }
      
      public function clear() : void
      {
         this.§_-MQ§(false);
         var _loc1_:int = 0;
         while(_loc1_ < this.data.length)
         {
            this.data[_loc1_].removeEventListener("LOADED",this.§_-l13§);
            _loc1_++;
         }
         this.data = new Vector.<§_-Rm§>();
         dispatchEvent(new §_-T25§(this.data.length));
      }
      
      public function §_-k1§(param1:Vector.<§_-Rm§>) : void
      {
         var _loc5_:int = 0;
         this.data = this.data.concat(param1);
         var _loc2_:Vector.<§_-Rm§> = new Vector.<§_-Rm§>();
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
               this.data[_loc4_].removeEventListener("LOADED",this.§_-l13§);
            }
            _loc3_[this.data[_loc4_].playerId] = this.data[_loc4_];
            _loc4_--;
         }
         this.data = _loc2_;
         this.§_-MQ§(this.data.length > 0);
         _loc4_ = 0;
         while(_loc4_ < this.data.length)
         {
            _loc5_ = this.§_-N2w§.indexOf(this.data[_loc4_].playerId);
            if(_loc5_ != -1)
            {
               this.§_-N2w§.splice(_loc5_,1);
            }
            this.data[_loc4_].addEventListener("LOADED",this.§_-l13§);
            _loc4_++;
         }
         dispatchEvent(new §_-T25§(this.data.length));
         this.§_-h1E§();
         this.§_-l13§();
      }
      
      private function §_-MQ§(param1:Boolean) : void
      {
         this.§_-T21§.visible = param1;
         this.§_-cI§.visible = param1;
         this.§_-32W§.visible = param1;
         this.§_-WG§.visible = param1;
         this.§_-IM§.visible = !param1;
      }
      
      public function §_-v1a§() : void
      {
         this.§_-WG§.selected = false;
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
         this.data = this.data.filter(this.§_-W7§);
         this.§_-h1E§();
         this.§_-l13§();
         this.§_-MQ§(this.data.length > 0);
         dispatchEvent(new §_-T25§(this.data.length));
         Connection.§_-Li§(§_-h2B§.§_-11S§,_loc1_,§_-h2B§.§_-F1B§);
      }
      
      public function §_-M1S§() : void
      {
         this.§_-WG§.selected = false;
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
         this.data = this.data.filter(this.§_-W7§);
         this.§_-h1E§();
         this.§_-l13§();
         this.§_-MQ§(this.data.length > 0);
         dispatchEvent(new §_-T25§(this.data.length));
         Connection.§_-Li§(§_-h2B§.§_-11S§,_loc1_,§_-h2B§.§_-R1g§);
      }
      
      private function init() : void
      {
         this.style = new StyleSheet();
         this.style.parseCSS(§_-I2U§);
         this.data = new Vector.<§_-Rm§>();
         this.places = new Vector.<§_-n1p§>();
         this.§_-c1V§ = new Vector.<CheckBox>();
         var _loc1_:Sprite = new Sprite();
         _loc1_.graphics.beginFill(15524553);
         _loc1_.graphics.drawRoundRectComplex(0,0,325,§_-42X§ * §_-p1h§ + 40,7.5,7.5,7.5,7.5);
         _loc1_.graphics.endFill();
         _loc1_.x = -5;
         _loc1_.y = -5;
         addChild(_loc1_);
         this.§_-WG§ = new CheckBox();
         this.§_-WG§.x = -1;
         this.§_-WG§.y = -3;
         this.§_-WG§.label = "";
         this.§_-WG§.addEventListener(Event.CHANGE,this.§_-mm§);
         addChild(this.§_-WG§);
         var _loc2_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,11,0);
         this.§_-T21§ = new §_-22V§(gls("Имя"),23,0,_loc2_);
         addChild(this.§_-T21§);
         this.§_-cI§ = new §_-22V§(gls("Уровень"),140,0,_loc2_);
         addChild(this.§_-cI§);
         this.§_-32W§ = new §_-22V§(gls("Дата"),236,0,_loc2_);
         addChild(this.§_-32W§);
         var _loc3_:TextFormat = new TextFormat(§_-22V§.§_-F2z§,18,6700045,true);
         this.§_-IM§ = new §_-22V§(gls("Заявок нет"),110,40,_loc3_);
         this.§_-IM§.visible = false;
         addChild(this.§_-IM§);
         this.§_-n2i§ = new ScrollPane();
         this.§_-n2i§.setSize(314,§_-42X§ * §_-p1h§);
         this.§_-n2i§.x = 0;
         this.§_-n2i§.y = 30;
         addChild(this.§_-n2i§);
         this.§_-93G§ = new Sprite();
         this.§_-n2i§.source = this.§_-93G§;
      }
      
      private function §_-h1E§() : void
      {
         var _loc3_:§_-n1p§ = null;
         var _loc4_:CheckBox = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.places.length)
         {
            this.places[_loc1_].§_-Uk§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-i2I§);
            this.§_-c1V§[_loc1_].removeEventListener(Event.CHANGE,this.§_-f2C§);
            if(this.places[_loc1_].parent)
            {
               this.places[_loc1_].parent.removeChild(this.places[_loc1_]);
               this.§_-c1V§[_loc1_].parent.removeChild(this.§_-c1V§[_loc1_]);
            }
            _loc1_++;
         }
         this.places = new Vector.<§_-n1p§>();
         this.§_-c1V§ = new Vector.<CheckBox>();
         var _loc2_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < this.data.length)
         {
            _loc3_ = new §_-n1p§();
            _loc3_.y = _loc2_;
            _loc3_.name = _loc1_.toString();
            _loc3_.§_-Uk§.styleSheet = this.style;
            _loc3_.§_-Uk§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-i2I§);
            this.§_-93G§.addChild(_loc3_);
            this.places.push(_loc3_);
            _loc4_ = new CheckBox();
            _loc4_.name = _loc1_.toString();
            --_loc3_.x;
            _loc4_.y = _loc3_.y - 4;
            _loc4_.label = "";
            _loc4_.addEventListener(Event.CHANGE,this.§_-f2C§);
            this.§_-93G§.addChild(_loc4_);
            this.§_-c1V§.push(_loc4_);
            _loc2_ += §_-p1h§;
            _loc1_++;
         }
         this.§_-n2i§.update();
      }
      
      private function §_-l13§(param1:Event = null) : void
      {
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < this.data.length)
         {
            if(this.data[_loc3_].player == null)
            {
               if(this.§_-N2w§.indexOf(this.data[_loc3_].playerId) == -1)
               {
                  _loc2_.push(this.data[_loc3_].playerId);
               }
            }
            else
            {
               this.places[_loc3_].visible = true;
               this.§_-c1V§[_loc3_].selected = this.data[_loc3_].selected;
               this.places[_loc3_].§_-h1I§.text = "[" + this.data[_loc3_].level + "]";
               this.places[_loc3_].§_-YE§.text = §_-ex§.§_-P1X§(this.data[_loc3_].time);
               §_-Y1S§.§_-uc§(this.places[_loc3_].§_-Uk§,this.data[_loc3_].player,122,true,true,true);
            }
            _loc3_++;
         }
         this.§_-N2w§ = this.§_-N2w§.concat(_loc2_);
         if(_loc2_.length != 0)
         {
            Game.request(_loc2_,§_-hF§.§_-31q§ | §_-hF§.§_-P13§ | §_-hF§.§_-329§);
         }
      }
      
      private function §_-mm§(param1:Event) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.data.length)
         {
            this.data[_loc2_].selected = this.§_-WG§.selected;
            _loc2_++;
         }
         this.§_-l13§();
      }
      
      private function §_-f2C§(param1:Event) : void
      {
         this.data[int(param1.currentTarget.name)].selected = Boolean(param1.currentTarget.selected);
      }
      
      private function §_-i2I§(param1:MouseEvent) : void
      {
         var _loc2_:int = this.data[int(param1.target.parent.name)].playerId;
         §_-927§.§_-i2I§(_loc2_);
      }
      
      private function §_-W7§(param1:§_-Rm§, param2:int, param3:Vector.<§_-Rm§>) : Boolean
      {
         if(!param3)
         {
         }
         if(param1.selected)
         {
            param2 = this.§_-N2w§.indexOf(param1.playerId);
            if(param2 != -1)
            {
               this.§_-N2w§.splice(param2,1);
            }
            param1.removeEventListener("LOADED",this.§_-l13§);
         }
         return !param1.selected;
      }
   }
}

