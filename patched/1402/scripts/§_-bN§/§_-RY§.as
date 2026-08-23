package §_-bN§
{
   import §_-J19§.§_-534§;
   import §_-X1k§.NotificationManager;
   import §_-X1k§.§_-Ac§;
   import §_-X1k§.§_-HZ§;
   import §_-X1k§.§_-N10§;
   import §_-X1k§.§_-P2x§;
   import §_-c2C§.Screen;
   import §_-c2C§.§_-e1v§;
   import §_-c2C§.§_-j2f§;
   import §_-c2C§.§_-t2c§;
   import §_-c2C§.§_-y10§;
   import §_-s2e§.§_-U2d§;
   import buttons.§_-K2G§;
   import buttons.§_-Q1W§;
   import buttons.§_-j2x§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.display.StageQuality;
   import flash.events.MouseEvent;
   import flash.filters.BevelFilter;
   import flash.filters.DropShadowFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.text.TextFormat;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import protocol.Connection;
   import protocol.§_-u1O§;
   import tape.§_-h2s§;
   import tape.§_-j5§;
   import utils.§_-j2O§;
   import utils.§_-xD§;
   import utils.§_-y1l§;
   
   public class §_-RY§ extends Dialog
   {
      
      private static const §_-f1j§:int = 10;
      
      private static const §_-53b§:Matrix = new Matrix(1,0,0,1,15,7);
      
      private static const §_-11M§:Matrix = new Matrix(1,0,0,1,2,2);
      
      private static const §_-4D§:Matrix = new Matrix(0.5,0,0,0.5,30,400);
      
      private static const §_-13Y§:Rectangle = new Rectangle(0,0,720,470);
      
      private static const §_-kV§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,28,16776571);
      
      private static const §_-Fh§:TextFormat = new TextFormat(§_-i5§.§_-p1s§,28,16764465);
      
      private static const §_-wF§:TextFormat = new TextFormat(null,18,16777215,true,null,null,null,null,"center");
      
      private static const §_-91g§:TextFormat = new TextFormat(null,18,3020044,true,null,null,null,null,"center");
      
      private static const §_-q2I§:Array = [new BevelFilter(1,58,16777215,1,10053120,1,2,2),new GlowFilter(6697728,1,4,4,8),new DropShadowFilter(2,45,0,1,2,2,0.25)];
      
      private static const §_-t1H§:Array = [new GlowFilter(2366553,0.9,10,10,3,2)];
      
      private static const §_-W0§:Array = [new GlowFilter(16180707,1,7,7,3,2)];
      
      public static var §_-W1s§:int = -1;
      
      public static var §_-JV§:Boolean = false;
      
      private static var §_-j25§:DisplayObject = null;
      
      private static var FRAME:DisplayObject = null;
      
      private static var _instance:§_-RY§ = null;
      
      private static var §_-4n§:Object = {};
      
      private static var §_-31Q§:Object = {};
      
      private static var §_-1I§:Object = {};
      
      private static var §_-Y4§:Object = {};
      
      private var §_-3n§:int = -1;
      
      private var §_-J1q§:int = -1;
      
      private var §_-U2o§:§_-j5§ = null;
      
      private var §_-v1q§:SimpleButton = null;
      
      private var §_-a1Z§:MovieClip = null;
      
      private var §_-G1U§:String;
      
      public function §_-RY§()
      {
         super(null,true,true,null,false);
         this.init();
      }
      
      public static function get instance() : §_-RY§
      {
         return _instance;
      }
      
      public static function show(param1:Boolean = false) : void
      {
         if(!_instance)
         {
            _instance = new §_-RY§();
         }
         if(!param1 && (§_-Ac§.§_-nG§ || !§_-JV§ && NotificationManager.instance.§_-m1X§ == §_-W1s§))
         {
            §_-t2c§.setStatus(§_-t2c§.TV);
            return;
         }
         NotificationManager.instance.§_-I3§(§_-W1s§);
         §_-N10§.§_-p2j§(§_-N10§.§_-FM§);
         _instance.show();
         §_-Ac§.§_-91§(§_-Ac§.§_-FM§);
      }
      
      public static function §_-c2p§(param1:int) : Class
      {
         var _loc2_:Object = §_-Hn§(param1);
         return _loc2_ ? getDefinitionByName(_loc2_.buttonClass) as Class : null;
      }
      
      public static function §_-RE§(param1:int) : MovieClip
      {
         var PageClass:Class;
         var page:MovieClip;
         var captionFormat:TextFormat;
         var caption:§_-i5§;
         var news:Object = null;
         var range:Object = null;
         var id:int = param1;
         if(id in §_-4n§)
         {
            return §_-4n§[id];
         }
         news = §_-Hn§(id);
         if(!news)
         {
            return null;
         }
         PageClass = getDefinitionByName(news.imageClass) as Class;
         if(!PageClass)
         {
            return null;
         }
         page = new PageClass();
         §_-4n§[id] = page;
         captionFormat = news.captionVariant == "yellow" ? §_-kV§ : §_-Fh§;
         caption = §_-338§(page,captionFormat,§_-q2I§,news.text);
         if(news.captionAccent)
         {
            range = news.captionAccent[§_-Zy§.§_-BI§ ? "ru" : "en"];
            if(range.begin > range.end)
            {
               caption.setTextFormat(news.captionVariant == "yellow" ? §_-Fh§ : §_-kV§,range.begin,range.end);
            }
         }
         if(news.bodyStyle == "brown_w")
         {
            §_-4J§(page,§_-91g§,§_-W0§,news.subtext);
         }
         else
         {
            §_-4J§(page,§_-wF§,§_-t1H§,news.subtext);
         }
         if(news.button)
         {
            §_-1I§[id] = addButton(page,news.button.text,function(param1:MouseEvent):void
            {
               runNewsAction(news);
               §_-N10§.used(§_-N10§.§_-FM§);
            });
         }
         §_-31Q§[id] = news.shareText || news.text + " " + news.subtext;
         return page;
      }
      
      private static function §_-338§(param1:MovieClip, param2:TextFormat, param3:Array, param4:String) : §_-i5§
      {
         var _loc5_:§_-i5§ = new §_-i5§(param4,0,33,param2);
         _loc5_.x = 350 - int(_loc5_.textWidth * 0.5);
         _loc5_.filters = param3;
         param1.addChild(_loc5_);
         return _loc5_;
      }
      
      private static function §_-4J§(param1:MovieClip, param2:TextFormat, param3:Array, param4:String) : void
      {
         var _loc5_:§_-i5§ = new §_-i5§(param4,0,75,param2);
         _loc5_.x = 350 - int(_loc5_.textWidth * 0.5);
         _loc5_.filters = param3;
         param1.addChild(_loc5_);
      }
      
      private static function addButton(param1:MovieClip, param2:String, param3:Function) : §_-K2G§
      {
         var _loc4_:§_-j2x§ = new §_-j2x§(param2,0,21,param3,1.5);
         _loc4_.x = 350 - int(_loc4_.width * 0.5);
         _loc4_.y = 400;
         param1.addChild(_loc4_);
         return _loc4_;
      }
      
      private static function §_-Hn§(param1:int) : Object
      {
         var _loc3_:Object = null;
         var _loc2_:Array = §_-HZ§.news;
         if(!_loc2_)
         {
            return null;
         }
         for each(_loc3_ in _loc2_)
         {
            if(Boolean(_loc3_) && _loc3_.id == param1)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      private static function §_-y2§(param1:String) : String
      {
         if(!param1)
         {
            return param1;
         }
         if(param1.indexOf("?lang=") >= 0 || param1.indexOf("&lang=") >= 0)
         {
            return param1;
         }
         var _loc2_:String = param1.indexOf("?") >= 0 ? "&" : "?";
         return param1 + _loc2_ + "lang=" + (§_-Zy§.§_-BI§ ? "ru" : "en");
      }
      
      private static function runNewsAction(param1:Object) : void
      {
         var button:Object = null;
         var target:Screen = null;
         var url:String = null;
         var news:Object = param1;
         button = news.button;
         if(!button)
         {
            return;
         }
         switch(button.actionType)
         {
            case "shopPackages":
               _instance.hide();
               §_-U2d§.load(function():void
               {
                  §_-534§.§_-R2X§(§_-534§.§_-jN§);
                  var _loc1_:int = int(button.outfit);
                  if(_loc1_)
                  {
                     §_-534§.§_-115§(§_-P2x§.§_-b2c§(_loc1_),_loc1_);
                  }
               });
               break;
            case "shopAccessories":
               _instance.hide();
               §_-U2d§.load(function():void
               {
                  §_-534§.§_-R2X§(§_-534§.§_-l1s§);
               });
               break;
            case "openScreen":
               _instance.hide();
               target = §_-t2c§.§_-u1Q§(button.screen);
               if(!target)
               {
                  break;
               }
               if(target is §_-j2f§ && "tab" in button)
               {
                  §_-j2f§.selected = int(button.tab);
               }
               if(target is §_-e1v§ || target is §_-y10§)
               {
                  §_-U2d§.load(function():void
                  {
                     §_-t2c§.show(target);
                  });
               }
               else
               {
                  §_-t2c§.show(target);
               }
               break;
            case "openUrl":
               url = button.url || "";
               if(url.length)
               {
                  _instance.hide();
                  navigateToURL(new URLRequest(§_-y2§(url)),"_blank");
               }
         }
      }
      
      override public function hide(param1:MouseEvent = null) : void
      {
         super.hide(param1);
         §_-t2c§.setStatus(§_-t2c§.TV);
      }
      
      private function init() : void
      {
         if("useApiType" in §_-uR§.§_-p2P§)
         {
            this.§_-G1U§ = §_-uR§.§_-p2P§["useApiType"];
         }
         else if("useapitype" in §_-uR§.§_-p2P§)
         {
            this.§_-G1U§ = §_-uR§.§_-p2P§["useapitype"];
         }
         else
         {
            this.§_-G1U§ = §_-Zy§.§_-R1A§;
         }
         place();
         this.width = 857;
         this.height = 587;
         var _loc1_:TextFormat = new TextFormat(§_-i5§.§_-p1s§,28,16777215);
         this.§_-v1q§ = new §_-Q1W§(gls("Поделиться!"),[_loc1_,_loc1_,_loc1_],ButtonNewsRepost,13,-10,[new BevelFilter(1,300,16777215,1,4948022,1,1,1)]);
         this.§_-v1q§.x = 335;
         this.§_-v1q§.y = 480;
         this.§_-v1q§.addEventListener(MouseEvent.CLICK,this.post);
         addChild(this.§_-v1q§);
         this.§_-a1Z§ = new ImageNewsAward();
         this.§_-a1Z§.mouseEnabled = false;
         this.§_-a1Z§.mouseChildren = false;
         this.§_-a1Z§.x = this.§_-v1q§.x + 370;
         this.§_-a1Z§.y = this.§_-v1q§.y + 7;
         addChild(this.§_-a1Z§);
         var _loc2_:Sprite = new Sprite();
         _loc2_.graphics.beginFill(16777215);
         _loc2_.graphics.lineStyle(1,14733249);
         _loc2_.graphics.drawRoundRect(10,480,310,70,15,15);
         _loc2_.filters = [new DropShadowFilter(4,136,13086614,1,6,6,1,1,true)];
         addChild(_loc2_);
         var _loc3_:§_-h2s§ = new §_-h2s§();
         _loc3_.setData(this.§_-Q1A§);
         this.§_-U2o§ = new §_-j5§(this.§_-w1T§);
         this.§_-U2o§.setData(_loc3_);
         addChild(this.§_-U2o§);
      }
      
      private function get §_-Q1A§() : Array
      {
         var _loc3_:Object = null;
         var _loc1_:Array = §_-HZ§.news;
         var _loc2_:Array = [];
         if(_loc1_)
         {
            for each(_loc3_ in _loc1_)
            {
               if(_loc3_)
               {
                  _loc2_.push(_loc3_.id);
               }
            }
         }
         if(!_loc2_.length)
         {
            return _loc2_;
         }
         _loc2_.sort(Array.NUMERIC);
         if(_loc2_.length > §_-f1j§)
         {
            _loc2_ = _loc2_.slice(_loc2_.length - §_-f1j§,_loc2_.length);
         }
         §_-W1s§ = _loc2_[_loc2_.length - 1];
         if(§_-W1s§ == NotificationManager.instance.§_-m1X§)
         {
            §_-L1H§.hide(NotificationManager.§_-FM§);
         }
         return _loc2_;
      }
      
      private function §_-w1T§(param1:int) : void
      {
         this.§_-8E§ = param1;
      }
      
      private function get §_-8E§() : int
      {
         return this.§_-J1q§;
      }
      
      private function set §_-8E§(param1:int) : void
      {
         this.§_-J1q§ = param1;
         this.§_-v1q§.filters = this.§_-Ik§ ? [] : §_-y1l§.§_-Tk§;
         this.§_-v1q§.mouseEnabled = this.§_-Ik§;
         this.§_-a1Z§.visible = this.§_-Ik§ && Game.§_-h5§.indexOf(this.§_-J1q§) == -1;
      }
      
      private function get §_-Ik§() : Boolean
      {
         return this.§_-G1U§ != "vk" && this.§_-G1U§ != "sa";
      }
      
      private function post(param1:MouseEvent) : void
      {
         this.§_-3n§ = this.§_-8E§;
         var _loc2_:String = getQualifiedClassName(§_-4n§[this.§_-8E§]);
         if(_loc2_.indexOf("::") != -1)
         {
            _loc2_ = _loc2_.split("::")[1];
         }
         §_-m2d§.save(this.§_-du§(),_loc2_);
         §_-j2O§.place(Game.self,§_-j2O§.WALL_NEWS,0,new Bitmap(this.§_-du§()),§_-31Q§[this.§_-8E§],§_-Zy§.§_-Y13§ + "news/" + _loc2_ + ".jpg",true,this.§_-5q§);
      }
      
      private function §_-5q§(param1:Object) : void
      {
         if(param1 == null || this.§_-3n§ == -1)
         {
            return;
         }
         Connection.§_-e2T§(§_-u1O§.§_-BP§,0,this.§_-3n§);
         Game.§_-h5§.push(this.§_-3n§);
         this.§_-3n§ = -1;
      }
      
      private function §_-du§() : BitmapData
      {
         if(this.§_-8E§ in §_-Y4§)
         {
            return §_-Y4§[this.§_-8E§];
         }
         var _loc1_:String = Game.stage.quality;
         §_-xD§.§_-Z1c§(StageQuality.HIGH);
         if(FRAME == null)
         {
            FRAME = new ImageNewsFrame();
         }
         if(§_-j25§ == null)
         {
            §_-j25§ = §_-uR§.§_-t2O§();
         }
         var _loc2_:BitmapData = new BitmapData(FRAME.width + 3,FRAME.height + 3);
         var _loc3_:DisplayObject = §_-1I§[this.§_-8E§];
         if(_loc3_)
         {
            _loc3_.visible = false;
         }
         _loc2_.draw(§_-4n§[this.§_-8E§],§_-53b§,null,null,§_-13Y§);
         if(_loc3_)
         {
            _loc3_.visible = true;
         }
         _loc2_.draw(§_-j25§,§_-4D§);
         _loc2_.draw(FRAME,§_-11M§);
         §_-Y4§[this.§_-8E§] = _loc2_;
         §_-xD§.§_-Z1c§(_loc1_);
         return §_-Y4§[this.§_-8E§];
      }
   }
}

